utilities
alphaCharacters
	" Answer a Collection with alphabetic characters "

	^ ( CharacterSet allCharactersBut: self invalidCharacters ) asOrderedCollection
		select: [: chr | chr asciiValue < 128 ]
		thenCollect: [: each | each asString ].