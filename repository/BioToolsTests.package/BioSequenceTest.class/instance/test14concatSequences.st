testing
test14concatSequences

	| seq1 seq2 result |
	
	seq1 := BioSequence newUnambiguousDNA: self sampleDnaString01.
	seq2 := BioSequence newUnambiguousDNA: self sampleDnaString02.
	result := seq1 , seq2.
	
	self assert: ( result isKindOf: BioSequence ).
	self assert: ( result alphabet isKindOf: BioIUPACUnambiguousDNA ).
	self assert: result length = ( seq1 length + seq2 length ).
	self assert: result asString = ( seq1 asString , seq2 asString ).


