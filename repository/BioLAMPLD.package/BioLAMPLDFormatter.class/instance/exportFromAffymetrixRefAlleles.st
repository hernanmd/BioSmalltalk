accessing
exportFromAffymetrixRefAlleles
	" Write a file with reference alleles (one allele by row) for PLINK, taken from Affymetrix full TXT report "

	self outputFile 
		nextPutAll: ((BioAffyTXTFormatter newFromInputFile: self inputFile) referenceAlleles joinUsing: Character cr);
		flush;
		close.