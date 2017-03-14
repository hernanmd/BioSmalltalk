examples
example3
	" Export BED, BIM and FAM files using plink "

	| wd |
	
	wd := self testFilesFullDirectoryName / 'pedmap'.
	BioLAMPLDFormatter new 
		inputFile: (wd / 'sample_ped') fullName;	
		outputFilename: (wd / 'sample_ped') fullName;
		referenceAllelesFile: (wd / 'reference_alleles.txt') fullName;		
		exportBed.
