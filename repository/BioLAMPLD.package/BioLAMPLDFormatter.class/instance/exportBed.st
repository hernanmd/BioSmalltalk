accessing
exportBed
	" Write 
	.bed file 
	.bim file
	.fam file
	
	using receiver's current parameters. Answer a <BioResultObject> "
	
	^ self plinkWrapper
		file: self inputFile;
		out: self outputFilename;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		