testing
testComplement

	self assert: ( self sequence complement isKindOf: BioSequence ).
	self assert: self sequence complement asString = self sampleSeq01Complementary.
	self assert: self sequence complementary = self sampleSeq01Complementary.
	
	sequence := BioSequence newWith: 'ggattcggatataattattgactgtacat'.
	
	self assert: ( sequence alphabet isKindOf: BioIUPACUnambiguousDNA ).
	self assert: sequence complement asString = 'cctaagcctatattaataactgacatgta'.
	
	sequence := 'a' asSequence.
	self assert: sequence complement asString = 't'.
	
	sequence := 'c' asSequence.
	self assert: sequence complement asString = 'g'.
	
	sequence := String empty asSequence.
	self assert: sequence complement asString = String empty.
	