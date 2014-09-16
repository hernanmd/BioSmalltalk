accessing
exportFrom: aCollection
	" Export data in CSV format in aCollection "

	self initializeStream: aCollection.
	self writeHeaderFrom: aCollection.
	self writeRowsFrom: aCollection.
	self outputToFile: self outputFilename contents: stream contents