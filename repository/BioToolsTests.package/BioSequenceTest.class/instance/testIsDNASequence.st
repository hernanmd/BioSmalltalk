testing
testIsDNASequence

	| seq1 seq2 seq3 |
	
	seq1 := BioSequence newAmbiguousDNA: 'AAGTCAGTGTACTATTAGCATGCATGTGCAACACATTAGCTG'.
	seq2 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq3 := BioSequence newProteinExtended: 'RRLRTGLARVGR'.
	
	self assert: seq1 isDNASequence.
	self deny: seq2 isDNASequence.
	self deny: seq3 isDNASequence.




