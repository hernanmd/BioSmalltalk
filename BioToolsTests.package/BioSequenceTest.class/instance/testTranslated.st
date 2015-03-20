testing
testTranslated

	| seq1 seq2 seq3 seq4 translated1 translated2 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCT'.

	translated1 := seq1 translate.
	translated2 := seq2 translateToStop.
	
	self assert: ( translated1 isKindOf: BioSequence ).
	self assert: ( translated2 isKindOf: BioSequence ).

	self assert: ( translated1 alphabet isKindOf: BioIUPACProtein ).
	self assert: ( translated2 alphabet isKindOf: BioIUPACProtein ).
	
	self assert: translated1 asString = 'KSVYY*HACATH*L'.
	self assert: translated2 asString = 'KSVYY'.

	seq3 := BioSequence newAmbiguousDNA: 'CGACGTCTTCGTACGGGACTAGCTCGTGTCGGTCGC'.
	seq4 := BioSequence newProtein: 'RRLRTGLARVGR'.

	self assert: seq3 translate = seq4.

	seq3 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq4 := BioSequence newProtein: 'MAIVMGR*KGAR*'.

	self assert: seq3 translate = seq4.
