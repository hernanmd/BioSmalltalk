accessing
exportFrom: data features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self features: (fCollection asOrderedCollection addFirst: 'Recognized Region'; yourself).
	self initializeStream: data.
	self writeHeaderFrom: self features.
	self writeRowsFrom: data.
	self 
		outputToFile: self outputFilename 
		contents: stream contents.

