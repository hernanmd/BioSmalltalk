Helper class to format files according to LAMP-LD input.

#!/bin/sh

# Usage: $ ./extract_column.sh Allele_A\\tAllele_B > extractedAlleles.csv

awk -F"\t" -v cols="${1:?}" '
   BEGIN {
     n=split(cols,col)
     for (i=1; i<=n; i++) s[col[i]]=i
   }
   NR==1 {
     for (f=1; f<=NF; f++)
       if ($f in s) c[s[$f]]=f
     next
   }
   { sep=""
     for (f=1; f<=n; f++) {
       printf("%c%s",sep,$c[f])
       sep=FS
     }
     print ""
   }
' Exported_Forward-Strand-Base-Call_No-Header.txt