accessing
exportFrom: aCollection
	" Export default features "

	self initializeStream: aCollection.
	self writeHeaderFrom: self gbKeys.
	self writeRowsFrom: aCollection features: self gbKeys.
	self 
		outputToFile: self outputFilename 
		contents: stream contents