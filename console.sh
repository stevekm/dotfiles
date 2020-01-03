# enable console text colors
export CLICOLOR=1

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
##############################################################################
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
export HISTFILESIZE=100000000
export HISTSIZE=100000000
