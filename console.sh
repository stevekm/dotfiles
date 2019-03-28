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
	printf '\033[0;35m[%s]\033[m\n' "$(date +%F\ %T)"
}
export PROMPT_COMMAND="echo; command_prompt_date_string"

##############################################################################
# Mange the bash history better
##############################################################################
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"
export HISTFILESIZE=1000000
export HISTSIZE=1000000
