##############################################################################
# Console Colors for Local Computer
# https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
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
    *) # red for everything else
        export PS1="\[\033[96m\]\u\[\033[m\]@\[\033[31m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        ;;
    esac
