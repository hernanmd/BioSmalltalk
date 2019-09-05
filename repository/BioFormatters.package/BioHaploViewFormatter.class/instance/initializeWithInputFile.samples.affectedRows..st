initialize-release
initializeWithInputFile: anInputFilename samples: aSamplesCollection affectedRows: affectedRowsCount

	self parser: (self parserClass on: anInputFilename asFileReference readStream).
	self parser delimiter: self delimiter.

	samplesCollection := aSamplesCollection.
	samplesSize := aSamplesCollection size.

	self 
		initMatrixRows: samplesSize 
		columns: affectedRowsCount / self samplesSize + 6.

