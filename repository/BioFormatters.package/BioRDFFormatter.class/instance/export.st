accessing
export

	self exportHeader.
	self exportPositions.
	self exportWeights.
	self exportFromAlignment: self samplesCollection.
	self outputToFile: self outputFilename , self formatExtension contents: self stream contents.


	