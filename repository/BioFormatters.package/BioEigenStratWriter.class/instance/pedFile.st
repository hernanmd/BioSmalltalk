accessing
pedFile
	" Answer a <FileStream> of the input PED file : 
	PED format details:
		One line per individual
		Each line contains 6 or 7 columns of information about the individual, plus two genotype columns for each SNP in the order the SNPs are specified in the snp file. 
		Genotype format MUST be either 0ACGT or 01234, where 0 means missing data.

	Example

         1      SAMPLE0 0 0 2 2  1 2  3 3  1 1  1 1  3 3  1 1  3 3
         2      SAMPLE1 0 0 1 2  1 2  1 3  1 4  1 1  1 3  1 1  3 3
         3      SAMPLE2 0 0 2 1  1 2  1 1  1 4  1 2  1 3  1 4  3 4
         4      SAMPLE3 0 0 1 1  2 2  1 3  4 4  2 2  1 1  1 4  3 4
         5      SAMPLE4 0 0 2 1  2 2  1 1  1 4  2 2  1 1  1 4  4 4
	"
	
	^ self inputFile