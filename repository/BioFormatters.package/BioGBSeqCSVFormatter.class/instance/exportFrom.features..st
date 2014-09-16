accessing
exportFrom: data features: features

	self initializeStream: data.
	self writeHeaderFrom: features.
	self writeRowsFrom: data features: features.
	self 
		outputToFile: self outputFilename 
		contents: stream contents.

