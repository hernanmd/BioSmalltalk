examples
example4
	" Export BED, BIM and FAM files using plink "

	| lf |
	lf := BioLAMPLDFormatter new.
	lf plinkWrapper
		noPheno;
		noParents;
		noSex.
	lf	
		inputFile: (self testFilesFullDirectoryName / 'pedmap' / 'sample_ped') fullName;	
		outputFilename: 'sample_ped';
		referenceAllelesFile: (self testFilesFullDirectoryName / 'pedmap' / 'reference_alleles.txt') fullName;		
		exportBed.
