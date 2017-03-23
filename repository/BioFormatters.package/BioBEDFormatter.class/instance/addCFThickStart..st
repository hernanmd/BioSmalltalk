accessing - adding features
addCFThickStart: aNumber

	self assert: [ self orderIndex = 6 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.