examples
example1
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |

	self platformCheck ifFalse: [ ^ self invalidPlatform ].
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName / '2-way'.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSize: 50;
		nrFounders: 2;
		positionsFile: 	(samplesDir / 'chr.pos') fullName;
		addPopFile: 		(samplesDir / 'pop1.hap') fullName atOrder: 1;
		addPopFile: 		(samplesDir / 'pop2.hap') fullName atOrder: 2;
		genosFile:		(samplesDir / 'genofile.gen') fullName;
		outputFile:		'lamp-ld_example1.out';
		execute.
	