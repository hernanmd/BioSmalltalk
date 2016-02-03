examples
example3
	" Export BED, BIM and FAM files using plink "

	BioLAMPLDFormatter new 
		inputFile: (self testFilesFullDirectoryName / 'pedmap' / 'sample_ped') fullName;	
		outputFilename: 'sample';
		referenceAllelesFile: (self testFilesFullDirectoryName / 'pedmap' / 'reference_alleles.txt') fullName;		
		exportBed.
