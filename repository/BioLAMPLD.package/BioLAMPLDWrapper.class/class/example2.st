examples
example2
	" Warning - This software is only available for Unix platforms "
	
	"
#!/bin/sh
# $1 = positions.pos
# $2 = population_1.ref
# $3 = population_2.ref
# $4 = population.geno

for windowSize in 30 40 50 60 70 80 90 100 130 150
do
    /usr/local/bin/unolanc2way $windowSize 2 $1 $2 $3 $4 lampld_ws-$windowSize.out
    perl /usr/local/src/LAMPLD-v1.1/convertLAMPLDout.pl lampld_ws-$windowSize.out postlampld_ws-$windowSize.txt
    perl standardizeOutput.pl lamp-ld 2 postlampld_ws-$windowSize.txt postlampld_ws-$windowSize-std_ancestry.txt
    perl averageAncestry.pl phased 2 postlampld_ws-$windowSize-std_ancestry.txt postlampld-avg-$windowSize.txt
done
	
	
	"
	