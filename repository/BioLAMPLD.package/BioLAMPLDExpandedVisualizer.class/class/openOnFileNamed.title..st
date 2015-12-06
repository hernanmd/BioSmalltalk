instance creation
openOnFileNamed: outFilename title: aString

	^ self new 
		initialize: outFilename;
		name: aString;
		open;
		yourself