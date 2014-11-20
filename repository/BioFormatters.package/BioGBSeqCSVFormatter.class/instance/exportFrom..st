accessing
exportFrom: aCollection
	" Export default features "

	self initializeStream: aCollection.
	self writeHeaderFrom: self features.
	self writeUnclassifiedRowsFrom: aCollection.
	self 
		outputToFile: self outputFilename 
		contents: stream contents