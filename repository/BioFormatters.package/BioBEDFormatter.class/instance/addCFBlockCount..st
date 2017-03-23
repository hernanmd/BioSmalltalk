accessing - adding features
addCFBlockCount: aNumber
	" Add the number of blocks (exons) in the BED line. "

	self assert: [ self orderIndex = 9 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.
