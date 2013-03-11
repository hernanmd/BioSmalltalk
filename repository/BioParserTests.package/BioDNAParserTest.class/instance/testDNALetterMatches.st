testing
testDNALetterMatches

	parser := #dnaLetter asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'a').
	self assert: (parser matches: 'A').
	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').

	self should: [parser matches: $a] 		raise: MessageNotUnderstood.
	self should: [parser matches: nil] 		raise: MessageNotUnderstood.