#!/bin/bash

req () {
    # requeue pending SLURM jobs to a new partition
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
