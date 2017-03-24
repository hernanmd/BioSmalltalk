accessing - adding features
addCFThickEnd: aNumber

	self assert: [ self orderIndex = 8 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.