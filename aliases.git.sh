##############################################################################
# Aliases & Functions for Git
##############################################################################
alias gp='git pull'
alias gpp='git pull && git push origin master'
alias gst='git status'
alias gau='git add -u'
alias gv='git remote -v'

# list all items managed by the current git repo
alias gtree='git ls-tree --full-tree -r HEAD'

# add an item to your .gitignore
gi () { echo "$1" >> .gitignore; printf "%s added to .gitignore" "$1" ; }
