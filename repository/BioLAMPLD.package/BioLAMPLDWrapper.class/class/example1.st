examples
example1
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |

	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSize: 50;
		nrFounders: 2;
		positionsFile:	(samplesDir / 'positions.pos') fullName;
		addAncHapsFile:	(samplesDir / 'population_1.ref') fullName;
		addAncHapsFile:	(samplesDir / 'population_2.ref') fullName;
		genosFile:		(samplesDir / 'population.geno') fullName;
		execute.
	