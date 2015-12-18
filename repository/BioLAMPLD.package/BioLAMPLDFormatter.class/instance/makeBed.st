accessing
makeBed

	^ (BioPLINKWrapper newFromInputFile: self pedInputFile)
		noWeb;
		makeBed;
		referenceAlleles: self referenceAllelesFilename
		