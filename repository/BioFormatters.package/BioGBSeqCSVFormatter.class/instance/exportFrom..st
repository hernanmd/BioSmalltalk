accessing
exportFrom: aCollection
	" Export default features "

	self initializeStream: aCollection.
	self writeHeaderFrom: self features.
	self writeUnclassifiedRowsFrom: aCollection.
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents