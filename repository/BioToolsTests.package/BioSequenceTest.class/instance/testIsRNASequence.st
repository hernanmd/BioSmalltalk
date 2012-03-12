testing
testIsRNASequence

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self deny: seq1 isRNASequence.
	self assert: seq2 isRNASequence.
	self deny: seq3 isRNASequence.




