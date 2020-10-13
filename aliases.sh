##############################################################################
# Aliases & Functions
##############################################################################
THIS_DIR="$(dirname $BASH_SOURCE)"
alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# make sure output is colorized; macOS doesnt support this option it seems
if [ $(uname) == 'Linux' ]; then
    alias ls='ls --color=auto'
fi

alias l='ls -Gah'
alias lt='ls -Glahtr'
alias ltt='ls -Glahtr | tail'
alias ll='ls -lah'

# kill all processes started by the current user
alias megakill="ps u | tr -s [[:space:]] | cut -f2 -d' ' | xargs kill"

source "${THIS_DIR}/t.sh"
source "${THIS_DIR}/catcsv.sh"
source "${THIS_DIR}/nheadt.sh"
source "${THIS_DIR}/nheadc.sh"
source "${THIS_DIR}/touchx.sh"
source "${THIS_DIR}/rf.sh"
source "${THIS_DIR}/rd.sh"
source "${THIS_DIR}/gdiff.sh"
source "${THIS_DIR}/nheads.sh"

