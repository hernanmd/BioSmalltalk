accessing
exportClassifiedRecordsFrom: data features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self features: fCollection.
	self initializeStream: data.
	self writeHeaderFrom: self features.
	self writeClassifiedRowsFrom: data.
	self 
		outputToFile: self outputFilename 
		contents: stream contents.

