accessing - adding features
addCFStrand: aCharacter

	self assert: [ self orderIndex = 6 ].
	self assert: [ { $. . $- . $+ } includes: aCharacter ].
	self outputFileStream 
		space;
		nextPut: aCharacter.
	self orderIndex: self orderIndex + 1.