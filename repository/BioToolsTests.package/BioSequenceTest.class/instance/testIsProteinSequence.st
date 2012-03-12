testing
testIsProteinSequence

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self deny: seq1 isProteinSequence.
	self deny: seq2 isProteinSequence.
	self assert: seq3 isProteinSequence.




