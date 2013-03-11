testing
testProteinLetterMatches

	parser := #proteinLetter asParser.
	
	'ACDEFGHIKLMNPQRSTVWYBXZJUO' do: [: letter |
		self assert: (parser matches: (String with: letter))].
	'acdefghiklmnpqrstvwybxzjuo' do: [: letter |
		self assert: (parser matches: (String with: letter))].

	self deny: (parser matches: '').
	self deny: (parser matches: '.').
	self assert: (parser matches: '?').
	self assert: (parser matches: '-').

	self should: [parser matches: $a] 	raise: MessageNotUnderstood.
	self should: [parser matches: nil] 	raise: MessageNotUnderstood.