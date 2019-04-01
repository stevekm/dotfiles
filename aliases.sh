##############################################################################
# Aliases & Functions
##############################################################################
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l='ls -Gah'
alias lt='ls -Glahtr'
alias ltt='ls -Glahtr | tail'
alias ll='ls -lah'

# Print CSV files to terminal better
# https://chrisjean.com/view-csv-data-from-the-command-line/
# NOTE: column does not handle lines over 2k in length. This limit is patched in version 9.0.6 of bsdmainutils. Unfortunately, most systems currently run 9.0.5 of that library
catcsv () {
    local myfile="$1"
    cat "$myfile" | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S
}


# Enumerate TSV and CSV file header fields, so you know which field to 'cut' on
nheadt () {
	local input_file="$1"
	head -1 "$input_file" | tr '\t' '\n' | cat -n
}

nheadc () {
	local input_file="$1"
	head -1 "$input_file" | tr ',' '\n' | cat -n
}

# touch a file and make it executable, useful for creating new scripts quickly with a single command
touchx () { touch "$1"; chmod +x "$1"; }


# transpose a file; https://stackoverflow.com/a/1729980/5359531
t () {
	awk '
{
    for (i=1; i<=NF; i++)  {
        a[NR,i] = $i
    }
}
NF>p { p = NF }
END {
    for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str" "a[i,j];
        }
        print str
    }
}' "${1}"
}

if [ "$(uname)" == "Darwin" ]; then
    # version for mac; install greadlink with Homebrew..
    rf () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            greadlink -f "$somedir}"
        fi

    }
else
    rf () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            readlink -f "${somedir}"
        fi

    }
fi


# kill all processes started by the current user
alias megakill="ps u | tr -s [[:space:]] | cut -f2 -d' ' | xargs kill"
