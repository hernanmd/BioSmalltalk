accessing
exportFrom: data features: fCollection

	self features: fCollection.
	self initializeStream: data.
	self writeHeaderFrom: self features.
	self writeRowsFrom: data.
	self 
		outputToFile: self outputFilename 
		contents: stream contents.

