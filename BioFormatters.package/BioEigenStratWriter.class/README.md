A BioEigenStratWriter reads

-A .PED file 
-A .CSV file with allele frequencies (from MSTools)

writes

-A .SNP file in EigenStrat format (from EigenSoft)
-A .GENO file

Conversion table for formats:

.geno + .snp + .ind = eigenstrat format
.ped + .pedsnp + .pedind = ped format
.ancestrymapgeno + .snp + .ind = ancestrymap format
.bed + .pedsnp + .pedind = packedped = PLINK format
.packedancestrymapgeno + .snp + .ind = packedancestrymap format

Sample script

| snpWriter pedFile alleleFqs fsRoot wrkFolder |
fsRoot := FileSystem disk root children at: 2.
wrkFolder := fsRoot resolve: 'MyWorkingFolder'.

pedFile := wrkFolder / 'input.ped'.
" allele frequencies from MSTools plugin "
alleleFqs := wrkFolder / 'input_Alleles_Fqs.csv'.

snpWriter := BioEigenStratWriter new
				alleleFqs: alleleFqs;
				outputFilename: 'eig_output.snp';
				pedFile: alleleFqs;
				yourself.
snpWriter writeAsEigenStrat.