instance creation
openOnCompactFileNamed: outFilename positionsFile: posFilename
	" Open the receiver using outFilename in compact format as input "

	^ self new 
		initialize: outFilename;
		posFile: posFilename;
		open;
		yourself