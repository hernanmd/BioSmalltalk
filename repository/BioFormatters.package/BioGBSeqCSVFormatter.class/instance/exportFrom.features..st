accessing
exportFrom: data features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self features: fCollection.
	self initializeStream: data.
	self writeHeaderFrom: self features.
	self writeUnclassifiedRowsFrom: data.
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents.
	self bioLog: 'Exported CSV contents in file ' , self outputFilename.
