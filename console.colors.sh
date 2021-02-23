##############################################################################
# Console Colors for Local Computer
# https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
##############################################################################

case "${HOSTNAME}" in
    "quark") # light blue
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[94m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    hg.*) # gray
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[90m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    silo|juno|j*) # green for known remote servers
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[92m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    *.ec2.*) # orange for AWS EC2
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[\e[38;5;214m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    *) # red for everything else
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[31m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    esac


# http://pnijjar.freeshell.org/2014/screentitles/
# Set current directory in screentitle
case $TERM in
    screen*)
        # This is the escape sequence ESC k ESC \
        SCREENTITLE='\[\ek\w\e\\\]'
        ;;
    *)
        SCREENTITLE=''
        ;;
esac
PS1="${SCREENTITLE}${PS1}"
