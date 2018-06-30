testing
testConcat

	| seq1 seq2 result |
	
	seq1 := BioSequence newUnambiguousDNA: self sampleDnaString01.
	seq2 := BioSequence newUnambiguousDNA: self sampleDnaString02.
	result := seq1 , seq2.
	
	self assert: (result isKindOf: BioSequence ).
	self assert: (result alphabet isKindOf: BioIUPACUnambiguousDNA).
	self assert: result length equals: (seq1 length + seq2 length).
	self assert: result asString equals: (seq1 asString , seq2 asString).


