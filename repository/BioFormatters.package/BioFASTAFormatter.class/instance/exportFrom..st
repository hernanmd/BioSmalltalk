accessing
exportFrom: aCollection
	" Write aCollection to the receiver's output file name "

	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: aCollection