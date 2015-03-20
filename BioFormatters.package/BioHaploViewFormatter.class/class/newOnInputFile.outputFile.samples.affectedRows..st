instance creation
newOnInputFile: anInputFilename outputFile: anOutputFilename samples: aSamplesCollection affectedRows: affectedRowsCount

	^ self new 
		initializeWithInputFile: anInputFilename 
		outputFile: anOutputFilename
		samples: aSamplesCollection
		affectedRows: affectedRowsCount