# Enumerate space delimited file header fields, so you know which field to 'cut' on
nheads () {
	local input_file="${1:-/dev/stdin}"
	head -1 "$input_file" | tr ' ' '\n' | cat -n
}
