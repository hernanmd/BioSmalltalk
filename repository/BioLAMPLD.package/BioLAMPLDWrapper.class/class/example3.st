examples
example3
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSizes: (30 to: 150);
		nrFounders: 2;
		positionsFile: 	(samplesDir / 'chr1.pos') fullName;
		addAncHapsFile:	(samplesDir / 'EUR_haps.ref') fullName;
		addAncHapsFile:	(samplesDir / 'NA_haps.ref') fullName;
		addAncHapsFile:	(samplesDir / 'YRI_haps.ref') fullName;			
		genosFile:		(samplesDir / 'trio.gen') fullName;
		executeWS.
	