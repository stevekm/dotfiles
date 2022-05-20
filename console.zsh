# zsh console customizations
# default: /etc/zshrc
export CLICOLOR=1

# history
HISTSIZE=2000000
SAVEHIST=1000000


# prompt
# Default prompt
# PS1="%n@%m %1~ %# "
PS1="%F{cyan}%n%f@%F{red}%m%f:%F{yellow}%~%f$ "
precmd() { printf '\n\033[0;35m[%s]\033[m\n' "$(date +%F\ %T)"; }
