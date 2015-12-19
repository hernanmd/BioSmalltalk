accessing
exportBed

	^ BioPLINKWrapper new 
		file: self inputFile;
		noWeb;
		makeBed;
		referenceAlleles: self referenceAllelesFilename
		