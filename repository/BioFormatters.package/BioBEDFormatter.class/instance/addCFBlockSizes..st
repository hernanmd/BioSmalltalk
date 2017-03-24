accessing - adding features
addCFBlockSizes: aCollection
	" Add block sizes in aCollection. The number of items in this list should correspond to blockCount. "

	| csl |
	self assert: [ self orderIndex = 11 ].
	csl := aCollection joinUsing: $,.
	self outputFileStream 
		space;
		nextPutAll: csl.
	self orderIndex: self orderIndex + 1.
