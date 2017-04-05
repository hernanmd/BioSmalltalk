examples
example3
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |
	
	self platformCheck ifFalse: [ ^ self invalidPlatform ].
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName / '3-way'.
	BioLAMPLDWrapper new
		unolanc;
		windowSizes: (30 to: 150);
		nrFounders: 2;
		positionsFile: 		(samplesDir / 'chr1.pos') fullName;
		addPopFile: 		(samplesDir / 'EUR_haps.ref') fullName atOrder: 1;
		addPopFile: 		(samplesDir / 'NA_haps.ref') fullName atOrder: 2;
		addPopFile: 		(samplesDir / 'YRI_haps.ref') atOrder: 3;
		genosFile:		(samplesDir / 'trio.gen') fullName;
		executeWS.
	