accessing
exportBed
	" Write 
	.bed file 
	.bim file
	.fam file
	
	using receiver's current parameters. Answer a <BioResultObject> "
	
	^ BioPLINKWrapper new 
		file: self inputFile;
		out: self inputFile;
		noWeb;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		