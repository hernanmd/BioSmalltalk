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

Implementation notes:

It uses two parsers: One for the PED fie, used to fill the genotype matrix and another one for a CSV file, to fill the name and positions.

