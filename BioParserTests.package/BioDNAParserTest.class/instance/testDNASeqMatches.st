testing
testDNASeqMatches

	parser := #dnaSequence asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'a').
	self assert: (parser matches: 'actg').
	self assert: (parser matches: 'A').
	self assert: (parser matches: 'ACTG').
	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').
	self deny: (parser matches: '8743'). 