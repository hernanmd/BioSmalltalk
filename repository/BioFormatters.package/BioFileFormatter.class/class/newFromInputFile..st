instance creation
newFromInputFile: aFilenameOrFileReference
	" Set the receiver's input file to be aFilename "

	^ self new inputFile: aFilenameOrFileReference