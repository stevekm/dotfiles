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
alias dc='docker compose'


##############################################################################
# Special Handling for portable ls colors
##############################################################################

# because GNU ls and macOS default BSD ls have different methods of enabling colors
# I spent way too much time trying to figure out the best way to keep colors active
# no matter which version of ls we are using
# the issue is complicated by the fact that some commonly used conda env's on macOS
# will pull in GNU coreutils which will override the macOS BSD ls with GNU ls
# so its not as simple as checking for macOS Darwin, you have to actually
# change the color method based on which ls you are using
# so far this is the resuling methodology;
# when this file gets 'source'd it will check for GNU or BSD ls and set different
# ls alias depending which it is
# later if you activate a conda env on macOS that switches you over to GNU ls
# you run the second alias 'relias' which simply 'source's this file again to
# re-set the ls alias to the correct one
# I guess that is simple enough
#
# at one point I was also handling this for some ll and lt aliases via functions
# however using the function method eats your * glob expansion
# so I disabled them but left the code for it here for reference


# NOTE: macOS BSD ls and GNU ls have different color args
# https://www.cyberciti.biz/faq/how-to-turn-on-or-off-colors-in-bash/
# macOS BSD: ls -G
# GNU: ls --color=auto
# NOTE: sometimes on macOS, using conda will install GNU ls ....
# https://stackoverflow.com/questions/1676426/how-to-check-the-ls-version
# NOTE: CLICOLOR env var enables colored output for ls only for BSD ls, not for GNU ls
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash

# make sure output is colorized; macOS doesnt support this option it seems
# NOTE the colors from macOS CLICOLOR is not the same as from ls --color=auto, but some colors are better than none

# NOTE: GNU ls has '--version' arg, BSD ls does not, so we are testing if its GNU ls here
if ls --version &>/dev/null; then
    alias ls='ls --color=auto'
fi

# re-source this aliases.sh script because when you activate a conda env that includes coreutils it breaks my ls alias
# so I need to retrigger the alias manually
alias realias="source ${THIS_DIR}/aliases.sh"

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



alias lt='ls -Glahtr'
# NOTE: same with the 'll' function method, this breaks on * globs so dont use it,
# and I fixed the ls colors issue with the ls alias + realias above instead
# lt () {
#   if ls --version &>/dev/null; then
#     ls --color=auto -lahtr ${1:-}
#   else
#     ls -Glahtr ${1:-}
#   fi
# }

# kill all processes started by the current user
# alias megakill="ps u | tr -s [[:space:]] | cut -f2 -d' ' | xargs kill"


# pull in these other useful shell functions that I have accumulated over the years
source "${THIS_DIR}/t.sh"
source "${THIS_DIR}/catcsv.sh"
source "${THIS_DIR}/nheadt.sh"
source "${THIS_DIR}/nheadc.sh"
source "${THIS_DIR}/touchx.sh"
source "${THIS_DIR}/rf.sh"
source "${THIS_DIR}/rd.sh"
source "${THIS_DIR}/gdiff.sh"
source "${THIS_DIR}/nheads.sh"
