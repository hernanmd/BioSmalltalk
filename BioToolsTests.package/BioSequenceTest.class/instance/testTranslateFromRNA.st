testing
testTranslateFromRNA

	| seq3 seq4 |
	
	seq3 := BioSequence newAmbiguousRNA: 'AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG'.
	seq4 := BioSequence newProtein: 'MAIVMGR*KGAR*'.

	self assert: seq3 translate = seq4.





