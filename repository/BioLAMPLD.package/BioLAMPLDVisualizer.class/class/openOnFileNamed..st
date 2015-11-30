instance creation
openOnFileNamed: outFilename

	^ self new 
		initialize: outFilename;
		open;
		yourself