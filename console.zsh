# zsh console customizations
# default: /etc/zshrc
export CLICOLOR=1

# history
HISTSIZE=2000000
SAVEHIST=1000000


# prompt
# Default prompt
# PS1="%n@%m %1~ %# "
# https://zsh-prompt-generator.site/
# https://apple.stackexchange.com/questions/30552/os-x-computer-name-not-matching-what-shows-on-terminal
_UNAME="$(uname)"
_COMPUTER_NAME="%m"
if [[ "${_UNAME}" == "Darwin" ]]; then _COMPUTER_NAME="$(scutil --get ComputerName)" ; fi
PS1="%F{cyan}%n%f@%F{red}${_COMPUTER_NAME}%f:%F{yellow}%~%f$ "
precmd() { printf '\n\033[0;35m[%s]\033[m\n' "$(date +%F\ %T)"; }
