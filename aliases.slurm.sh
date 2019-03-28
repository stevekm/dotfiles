##############################################################################
# Aliases & Functions for SLURM (generic)
##############################################################################
# get node usage metrics on SLURM
alias sload='sinfo -N -O nodelist,partition,statelong,cpusstate,memory,freemem'
# https://slurm.schedmd.com/sinfo.html

# check your current SLURM jobs
# alias sq="squeue -u $USER -o '%10i %15P %10T %10M %10S %12l %3C %15R %45j' --long"
alias sq="squeue -u $USER -o '%10i %15P %10T %20V %20S %10M %12l %3C %15R %45j' --long"

# shorter version for lower res screen
alias sq2="squeue -u $USER -o '%10i %15P %10T %10M %10S %12l %3C %15R %30j' --long"

# count the total number of CPU cores you have allocated across all running jobs
alias scpus='squeue -u $USER -o "%T %C" | grep "RUNNING" | cut -d " " -f2 | paste -sd+ | bc'
# alias scpus='squeue -u $USER -o "%.T %.3C" | grep "RUNNING" | tr -s "[:space:]" | cut -d " " -f2 | paste -sd+ | bc'

# count all the submitted cpus
alias scpusa='squeue -u $USER -o "%C" | tail -n +2 | tr -s "[:space:]" | paste -sd+ | bc'

# get the cluster node availablility; free CPUs allocated/idle/other/total, mem, and allocated mem
qv () {
	# collapse the sinfo table on the duplicate partition entries
printf "FREE_MEM\tALLOCMEM\tCPUS(A/I/O/T)\tHOSTNAMES\tPARTITION\n%s\n" "$(sinfo -O 'freemem,allocmem,cpusstate,nodehost,partition' | tail -n +2 | awk '{OFS="\t"; idx=$1 OFS $2 OFS $3 OFS $4 }{a[idx]=(idx in a)?a[idx]","$NF:$NF}END{for(i in a) print i,a[i]}' | sort -k 4)"
}
# QAVAIL="/gpfs/data/molecpathlab/pipelines/queue-stats/qavail.py"
# alias qv="${QAVAIL}"

# get extended sacct info for a job
saj () {
sacct -j "$1" --format="JobID,JobName,Partition,AllocCPUS,AveCPU,MaxRSS,ReqMem,Submit,Start,End,Timelimit,NodeList,State,ExitCode"
}

# requeue pending SLURM jobs to a new partition
req () {
    local qto="${1:-none}"
    local qfrom="${2:-none}"

    if [ "${qto}" == "none" ]; then
        echo "error: qto must be supplied as first arg"
        exit 1
    fi

    if [ "${qfrom}" != "none" ]; then
        squeue -u $USER -O "jobid,state,partition" | \
        tr -s [[:space:]] | \
        grep PENDING | \
        grep "${qfrom}" | \
        cut -d ' ' -f1 | while read item; do
            scontrol update JobId="$item" Partition="${qto}"
        done
    else
        squeue -u $USER -O "jobid,state,partition" | \
        tr -s [[:space:]] | \
        grep PENDING | \
        cut -d ' ' -f1 | while read item; do
            scontrol update JobId="$item" Partition="${qto}"
        done
    fi
}
