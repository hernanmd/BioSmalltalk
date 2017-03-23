accessing - adding features
addCFScore: aNumber
	" Add a description for custom tracks. aNumber must be between 0 and 1000 "

	self assert: [ aNumber between: 0 and: 1000 ].
	self assert: [ self orderIndex = 4 ].
	self outputFileStream 
		space;
		nextPutAll: aNumber asString.
	self orderIndex: self orderIndex + 1.