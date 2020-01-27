#!/bin/bash
# Enumerate TSV and CSV file header fields, so you know which field to 'cut' on
nheadc () {
	local input_file="$1"
	head -1 "$input_file" | tr ',' '\n' | cat -n
}
