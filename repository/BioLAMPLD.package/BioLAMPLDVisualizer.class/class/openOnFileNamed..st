instance creation
openOnFileNamed: outFilename
	" Open the receiver using outFilename as input "

	^ self new 
		initialize: outFilename;
		open;
		yourself