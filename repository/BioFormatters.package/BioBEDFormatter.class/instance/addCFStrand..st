accessing - adding features
addCFStrand: aCharacter

	self assert: [ self orderIndex = 5 ].
	self assert: [ { $. . $- . $+ } includes: aCharacter ].
	self outputFileStream 
		space;
		nextPut: aCharacter.
	self orderIndex: self orderIndex + 1.