if [ $ZSH_VERSION ]; then
  THIS_DIR="$(dirname "${(%):-%x}")"
else
  THIS_DIR="$(dirname $BASH_SOURCE)"
fi
##############################################################################
# Aliases & Functions
##############################################################################

alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# NOTE: macOS BSD ls and GNU ls have different color args
# https://www.cyberciti.biz/faq/how-to-turn-on-or-off-colors-in-bash/
# macOS BSD: ls -G
# GNU: ls --color=auto
# NOTE: sometimes on macOS, using conda will install GNU ls ....
# https://stackoverflow.com/questions/1676426/how-to-check-the-ls-version

# make sure output is colorized; macOS doesnt support this option it seems
if ls --version &>/dev/null; then
    alias ls='ls --color=auto'
fi

alias ll='ls -lah'

# NOTE: removed this because it breaks globs
# there might already be an alias for ll from the global system
# https://askubuntu.com/questions/372926/bash-syntax-error-near-unexpected-token
# https://stackoverflow.com/questions/9783507/how-can-i-check-in-my-bashrc-if-an-alias-was-already-set
# unalias ll 2>/dev/null
# ll () {
#   # only GNU has --version flag, needs --color=auto
#   if ls --version &>/dev/null; then
#     ls --color=auto -lah ${1:-}
#   else
#     # it must be BSD version so use -G
#     ls -Glah ${1:-}
#  fi
# }



# alias lt='ls -Glahtr'
lt () {
  if ls --version &>/dev/null; then
    ls --color=auto -lahtr ${1:-}
  else
    ls -Glahtr ${1:-}
  fi
}

# kill all processes started by the current user
# alias megakill="ps u | tr -s [[:space:]] | cut -f2 -d' ' | xargs kill"


source "${THIS_DIR}/t.sh"
source "${THIS_DIR}/catcsv.sh"
source "${THIS_DIR}/nheadt.sh"
source "${THIS_DIR}/nheadc.sh"
source "${THIS_DIR}/touchx.sh"
source "${THIS_DIR}/rf.sh"
source "${THIS_DIR}/rd.sh"
source "${THIS_DIR}/gdiff.sh"
source "${THIS_DIR}/nheads.sh"
