accessing
export
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportPositions.
	self exportWeights.
	self exportFromAlignment: self samples.
	self 
		dumpToFileNamedFullPath: self outputFilename
		contents: self stream contents.


	