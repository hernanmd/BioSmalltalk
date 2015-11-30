instance creation
openOnFileNamed: outFilename

	^ self new 
		initialize: outFilename asFileReference contents;
		open