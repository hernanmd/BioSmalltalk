accessing
export
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportPositions.
	self exportWeights.
	self exportFromAlignment: self samplesCollection.
	self 
		outputToFullFile: self outputFilename
		contents: self stream contents.


	