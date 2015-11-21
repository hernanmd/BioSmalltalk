testing
testAlphabet

	self assert: ( self sequence alphabet isKindOf: BioAlphabet ).
	self assert: ( self sequence unknownLetter = BioAlphabet new defaultUnknownElement ).
	self sequence unknownLetter: $?.
	self assert: ( self sequence alphabet isKindOf: BioAlphabet ).	
	self assert: self sequence unknownLetter = $?