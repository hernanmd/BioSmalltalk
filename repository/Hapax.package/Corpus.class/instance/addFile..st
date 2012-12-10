adding
addFile: aFilename

	self addDocument: aFilename asString with: (Terms new 
		addString: aFilename contentsOfEntireFile using: CamelcaseScanner; yourself)