accessing
exportFrom: aCollection
	" Write aCollection to the receiver's output file name "

	self 
		outputToFullFile: self outputFilename 
		contents: aCollection