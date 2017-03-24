accessing - adding features
addCFBlockStarts: aCollection
	" Add block sizes in aCollection. All of the blockStart positions should be calculated relative to chromStart. The number of items in this list should correspond to blockCount. "

	| csl |
	self assert: [ self orderIndex = 12 ].
	csl := aCollection joinUsing: $,.
	self outputFileStream 
		space;
		nextPutAll: csl;
		nextPutTerminator
