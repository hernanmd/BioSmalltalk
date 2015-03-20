testing
testIndicesOfAscii

	| ind1 ind2 |
	
	ind1 := 'AC  NNTG' indicesOfCharacter: Character space.
	self assert: ( ind1 isKindOf: Collection ).
	self assert: ind1 first = 3.
	self assert: ind1 second = 4.
	
	ind2 := 'A--CT--TG' indicesOfCharacter: $-.
	self assert: ( ind2 isKindOf: Collection ).
	self assert: ind2 asArray = #(2 3 6 7).
	
	self assert: ( '' indicesOfCharacter: $- ) isEmpty.