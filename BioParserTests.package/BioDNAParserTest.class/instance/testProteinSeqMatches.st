testing
testProteinSeqMatches

	parser := #proteinSequence asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'p').
	self assert: (parser matches: 'MNPQRSTVW' asLowercase).
	self assert: (parser matches: 'P').
	self assert: (parser matches: 'MNPQRSTVW').
	self assert: (parser matches: '-').
	self assert: (parser matches: '?').
	self deny: (parser matches: '8743').