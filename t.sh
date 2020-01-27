# transpose a file; https://stackoverflow.com/a/1729980/5359531
t () {
	awk '
    BEGIN { IFS = "\t"; OFS = "\t"; FS = "\t" }
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
