# Enumerate TSV and CSV file header fields, so you know which field to 'cut' on
nheadt () {
	local input_file="${1:-/dev/stdin}"
	head -1 "$input_file" | tr '\t' '\n' | cat -n
}
