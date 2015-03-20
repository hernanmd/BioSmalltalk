testing
testComplement

	| seq1 seq2 comp |
	
	seq1 := BioSequence newAmbiguousDNA: 'TACTCGTAATTCACT'.
	seq2 := BioSequence newAmbiguousDNA: 'ATGAGCATTAAGTGA'.

	comp := seq1 complement.

	self assert: 'TACTCGTAATTCACT' asSequence complementary = 'ATGAGCATTAAGTGA'.
	self assert: ( comp isKindOf: BioSequence ).
	self assert: ( comp alphabet isKindOf: BioIUPACDNA ).
	self assert: comp = seq2.
	self assert: comp asString = 'ATGAGCATTAAGTGA'.




