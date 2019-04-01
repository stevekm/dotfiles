##############################################################################
# Aliases & Functions for NYULMC BIG PURPLE HPC
##############################################################################
# check for screens on all Big Purple head nodes
alias screens2='for s in bigpurple-ln1 bigpurple-ln2 bigpurple-ln3 bigpurple-ln4; do ssh "$s" <<<"screen -ls" ; done'
alias screens='ls -1 /var/run/screen/S-$USER'

# same but for cron
alias crontabs='for s in bigpurple-ln1 bigpurple-ln2 bigpurple-ln3 bigpurple-ln4; do ssh "$s" <<<"crontab -l" ; done'

alias tmuxes='for s in bigpurple-ln1 bigpurple-ln2 bigpurple-ln3 bigpurple-ln4; do ssh "$s" <<<"tmux ls" ; done'

# check the queue stats json log on Big Purple
QSTAT_JSON="/gpfs/data/molecpathlab/pipelines/queue-stats/qstats.log"
alias qst="tail -1 ${QSTAT_JSON}"

# Big Purple hpc specific items
alias qtot='/gpfs/data/molecpathlab/pipelines/queue-stats/qtotal.py'
alias qav='/gpfs/data/molecpathlab/pipelines/queue-stats/qavail.py'

export PATH="/gpfs/data/molecpathlab/pipelines/queue-stats:$PATH"
