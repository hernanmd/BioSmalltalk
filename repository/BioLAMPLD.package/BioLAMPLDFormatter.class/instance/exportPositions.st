accessing
exportPositions
	" Write .bed, .bim file and .fam files using a reference allele file to force specific allele as A1 (which might not be the minor allele) and input file. Answer a <BioResultObject> "
	
	^ self plinkWrapper
		file: self inputFile;
		out: self outputFilename;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		