accessing
exportFrom: aCollection
	" Export default features "

	self initializeStream: aCollection.
	self writeHeaderFrom: self features.
	self writeRowsFrom: aCollection.
	self 
		outputToFile: self outputFilename 
		contents: stream contents