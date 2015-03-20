testing
testHasAmbiguousBases

	| seq1 seq2 seq3 result |
	
	seq1 := BioSequence newAmbiguousDNA: self sampleDnaString03.
	seq2 := BioSequence newAmbiguousDNA: self sampleDnaString02.
	seq3 := BioSequence newAmbiguousDNA: self sampleDnaString04.
	
	self assert: seq1 hasAmbiguousBases.
	self deny: seq2 hasAmbiguousBases.
	self assert: seq3 hasAmbiguousBases.

	seq1 := BioSequence newAmbiguousRNA: self sampleRnaString01.
	seq2 := BioSequence newAmbiguousRNA: self sampleRnaString02.

	self assert: seq1 hasAmbiguousBases.
	self deny: seq2 hasAmbiguousBases.
	
	seq1 := BioSequence newProtein: self sampleProtString01.
	seq2 := BioSequence newProtein: self sampleProtString02.

	self deny: seq1 hasAmbiguousBases.
	self assert: seq2 hasAmbiguousBases.