accessing
exportClassifiedRecordsFrom: anObject features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self features: fCollection.
	self initializeStream: anObject matches.
	self writeHeaderFrom: self features.
	self writeClassifiedRowsFrom: anObject matches.
	self 
		outputToFile: self outputFilename 
		contents: stream contents.

