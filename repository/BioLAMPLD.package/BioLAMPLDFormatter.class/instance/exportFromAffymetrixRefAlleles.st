accessing
exportFromAffymetrixRefAlleles
	" Write a file with reference alleles (one allele by row) for PLINK, taken from Affymetrix full TXT report "

	self outputFileStream
		nextPutAll: self parseReferenceAlleles;
		flush;
		close