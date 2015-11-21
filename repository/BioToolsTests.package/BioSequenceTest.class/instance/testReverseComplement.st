testing
testReverseComplement

	| seq1 seq2 revComp |
	
	seq1 := BioSequence newAmbiguousDNA: 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC'.
	seq2 := BioSequence newAmbiguousDNA: 'GCTAATGCCGTAGTAATTTTCCCGTCCTCCCGT'.

	revComp := seq1 reverseComplement.

	self assert: (revComp isKindOf: BioSequence).
	self assert: (revComp alphabet isKindOf: BioIUPACDNA).
	self assert: revComp = seq2.
	self assert: revComp asString = 'GCTAATGCCGTAGTAATTTTCCCGTCCTCCCGT'.

	seq1 := BioSequence newUnambiguousDNA: 'CTAAACATCCTTCAT'.
	seq2 := BioSequence newUnambiguousDNA: 'ATGAAGGATGTTTAG'.
	
	self assert: seq1 reverseComplement asString = seq2 asString.
	self assert: (seq1 reverseComplement alphabet isKindOf: BioIUPACUnambiguousDNA).
	



