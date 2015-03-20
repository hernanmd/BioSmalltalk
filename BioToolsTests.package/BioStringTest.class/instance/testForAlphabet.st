testing
testForAlphabet

	| seq1 seq2 seq3 |
	
	seq1 := '    ACTG ' asSequenceForAlphabet: BioNullAlphabet.
	self assert: ( seq1 isKindOf: BioSequence ).
	self assert: seq1 asString = 'ACTG'.
	self assert: ( seq1 alphabet isKindOf: BioNullAlphabet ).
	
	seq2 := 'ACNNNNTG' asSequenceForAlphabet: BioNullAlphabet.
	self assert: ( seq2 isKindOf: BioSequence ).
	self assert: seq2 asString = 'ACNNNNTG'.
	self assert: ( seq2 alphabet isKindOf: BioNullAlphabet ).	

	seq3 := 'TCAGTTACACACATCTGTCGAGACGTAAATTACGGATGAGTTATTCGCTACCTACATGCAAACGGAGCATCCATGTTCTTTATT' asSequenceForAlphabet: BioIUPACUnambiguousDNA.
	self assert: ( seq3 isKindOf: BioSequence ).
	self assert: seq3 asString = 'TCAGTTACACACATCTGTCGAGACGTAAATTACGGATGAGTTATTCGCTACCTACATGCAAACGGAGCATCCATGTTCTTTATT'. 
	self assert: ( seq3 alphabet isKindOf: BioIUPACUnambiguousDNA ).
