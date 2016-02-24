examples
example1
	" Warning - This software is only available for Unix platforms "
	| samplesDir |
	samplesDir := BioObject testFilesFullDirectoryName.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSize: 50;
		nrFounders: 2;
		positionsFile: (samplesDir / 'positions.pos') fullName;
		ancestralHaplotypesFile1: (samplesDir / 'population_1.ref') fullName;
		ancestralHaplotypesFile2: (samplesDir / 'population_2.ref') fullName;
		genotypesFile: (samplesDir / 'population.geno') fullName;
		execute.
	