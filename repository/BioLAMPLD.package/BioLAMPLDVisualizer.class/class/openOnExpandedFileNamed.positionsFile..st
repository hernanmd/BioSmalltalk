instance creation
openOnExpandedFileNamed: expandedFilename positionsFile: posFilename
	" Open the receiver using expandedFilename as input. The expanded file is the result of applying the convertLAMPLDout.pl script  "

	^ self new 
		posFile: posFilename;	
		readExpanded: expandedFilename;
		open;
		yourself