##############################################################################
# Aliases and settings for ssh connections
##############################################################################
# keep ssh from dying due to inactivity
alias ssh='ssh -o ServerAliveInterval=60'
##############################################################################
# prevent git from trying to open GUI window for password entry
##############################################################################
[ -n "$SSH_CONNECTION" ] && unset SSH_ASKPASS
# I commented this out when I couldnt clone a git repo from NYULMC github
# I re-un-commented this when I couldnt clone another git repo..
