# zsh console customizations
# default: /etc/zshrc
export CLICOLOR=1
# NOTE: CLICOLOR enables colored output for ls only for BSD ls, not for GNU ls
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash

# history
# https://superuser.com/questions/1517138/increase-the-size-of-history-for-zsh
# https://wiki.zshell.dev/docs/guides/customization#history-optimization
export HISTSIZE=1000000000
export SAVEHIST=1000000000

# TODO: history backups https://stackoverflow.com/questions/30249853/save-zsh-history-to-persistent-history


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
