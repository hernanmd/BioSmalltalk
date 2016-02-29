accessing
exportBed
	" Write 
	.bed file 
	.bim file
	.fam file
	
	using receiver's current parameters. Answer a <BioResultObject> "
	
	^ BioPLINKWrapper new 
		file: self inputFile;
		out: self outputFile;
		noPheno;
		noParents;
		noSex;
		noWeb;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		