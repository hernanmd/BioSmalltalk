accessing
exportFrom: aCollection
	" Write aCollection to the receiver output stream "

	self 
		outputToFullFile: self outputFilename 
		contents: aCollection