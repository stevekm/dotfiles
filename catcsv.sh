#!/bin/bash
# Print CSV files to terminal better
# https://chrisjean.com/view-csv-data-from-the-command-line/
# NOTE: column does not handle lines over 2k in length. This limit is patched in version 9.0.6 of bsdmainutils. Unfortunately, most systems currently run 9.0.5 of that library
catcsv () {
    local myfile="$1"
    cat "$myfile" | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S
}
