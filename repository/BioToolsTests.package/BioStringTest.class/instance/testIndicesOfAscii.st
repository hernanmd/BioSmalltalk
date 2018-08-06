testing
testIndicesOfAscii

	| ind1 ind2 |
	
	ind1 := 'AC  NNTG' indicesOfCharacter: Character space.
	self assert: (ind1 isKindOf: Collection).
	self assert: ind1 first equals: 3.
	self assert: ind1 second equals: 4.
	
	ind2 := 'A--CT--TG' indicesOfCharacter: $-.
	self assert: (ind2 isKindOf: Collection).
	self assert: ind2 asArray equals: #(2 3 6 7).
	
	self assert: ('' indicesOfCharacter: $-) isEmpty.