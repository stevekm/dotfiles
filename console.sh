# NOTE: dont use this file with zsh on macOS, use the console.zsh file instead

# enable console text colors
export CLICOLOR=1

# NOTE: CLICOLOR enables colored output for ls only for BSD ls, not for GNU ls
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash

##############################################################################
# Timestamp bash Prompt
# from here: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# ex:
# [2017-06-02 13:46:36]
# kellys04@mac01:~$
##############################################################################

command_prompt_date_string () {
	printf '\033[0;35m[%s](%s)\033[m\n' "$(date +%F\ %T)" "$SHLVL"
}
export PROMPT_COMMAND="echo; command_prompt_date_string"

##############################################################################
# Mange the bash history better
# HISTSIZE
# 	   The  number  of commands to remember in the command history (see HISTORY below).  If the value is 0, commands are not saved in the history list.  Numeric values less than
# 	   zero result in every command being saved on the history list (there is no limit).  The shell sets the default value to 500 after reading any startup files.
#
# HISTFILESIZE
# 	   The maximum number of lines contained in the history file.  When this variable is assigned a value, the history file is truncated, if necessary, to contain no  more  than
# 	   that number of lines by removing the oldest entries.  The history file is also truncated to this size after writing it when a shell exits.  If the value is 0, the history
# 	   file is truncated to zero size.  Non-numeric values and numeric values less than zero inhibit truncation.  The shell sets the default value to the value of HISTSIZE after
# 	   reading any startup files.
# HISTCONTROL
#
#     A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ignorespace, lines which begin with a space character are not saved in the history list. A value of ignoredups causes lines matching the previous history entry to not be saved. A value of ignoreboth is shorthand for ignorespace and ignoredups. A value of erasedups causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not in the above list is ignored. If HISTCONTROL is unset, or does not include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of HISTIGNORE. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTCONTROL.
#
# $ help history | grep -E -- '-a|-r'
#       -a    append history lines from this session to the history file
#       -r    read the history file and append the contents to the history
#
## Make Bash append rather than overwrite the history on disk:
# shopt -s histappend
# https://linux.die.net/man/1/bash
##############################################################################
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

# Non-numeric values and numeric values less than zero inhibit truncation.
# The maximum number of lines contained in the history file.
export HISTFILESIZE=100000000
# The number of commands to remember in the command history (see HISTORY below). The default value is 500.
export HISTSIZE=100000000

##############################################################################
# https://lukas.zapletalovi.com/2013/03/never-lost-your-bash-history-again.html
# NOTE: I modified the script a little
#####
# This script creates monthly backups of the bash history file. Make sure you have
# HISTSIZE set to large number (more than number of commands you can type in every
# month). It keeps last 200 commands when it "rotates" history file every month.
# Typical usage in a bash profile:
#
# HISTSIZE=90000
# source ~/bin/history-backup
#
# And to search whole history use:
# grep xyz -h --color ~/bash_history/*
#

KEEP=10000
BASH_HIST=~/.bash_history
BASH_HIST_DIR=~/bash_history
mkdir -p "${BASH_HIST_DIR}"
BACKUP="${BASH_HIST_DIR}/bash_history.$(date +%y%m)"
# use these vars so I can tell what behavior this script took from env
export HIST_FILE_IS_NEWER="False"
export HIST_FILE_COPIED_CURRENT_TO_BACKUP="False"
export HIST_FILE_CREATED_NEW_BACKUP="False"

# -s file is not zero size
# -a "and" operator for multple tests
# -nt file f1 is newer than f2
if [ -s "$BASH_HIST" -a "$BASH_HIST" -nt "$BACKUP" ]; then
  # history file is newer then backup
  HIST_FILE_IS_NEWER="True"
  if [[ -f $BACKUP ]]; then
    # there is already a backup
    # cp -f $BASH_HIST $BACKUP && HIST_FILE_COPIED_CURRENT_TO_BACKUP="True"
    /bin/cp $BASH_HIST $BACKUP && HIST_FILE_COPIED_CURRENT_TO_BACKUP="True"
  else
    # create new backup, leave last few commands and reinitialize
    mv -f $BASH_HIST $BACKUP && HIST_FILE_CREATED_NEW_BACKUP="True"
    tail -n$KEEP $BACKUP > $BASH_HIST
    history -r
  fi
fi
