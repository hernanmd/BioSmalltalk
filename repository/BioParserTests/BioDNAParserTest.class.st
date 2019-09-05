Class {
	#name : #BioDNAParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #testing }
BioDNAParserTest >> testDNALetterMatches [

	parser := #dnaLetter asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'a').
	self assert: (parser matches: 'A').
	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').

	self should: [parser matches: $a] 		raise: MessageNotUnderstood.
	self should: [parser matches: nil] 		raise: MessageNotUnderstood.
]

{ #category : #testing }
BioDNAParserTest >> testDNASeqMatches [

	parser := #dnaSequence asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'a').
	self assert: (parser matches: 'actg').
	self assert: (parser matches: 'A').
	self assert: (parser matches: 'ACTG').
	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').
	self deny: (parser matches: '8743'). 
]

{ #category : #testing }
BioDNAParserTest >> testProteinLetterMatches [

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
]

{ #category : #testing }
BioDNAParserTest >> testProteinSeqMatches [

	parser := #proteinSequence asParser.
	
	self deny: (parser matches: '').
	self assert: (parser matches: 'p').
	self assert: (parser matches: 'MNPQRSTVW' asLowercase).
	self assert: (parser matches: 'P').
	self assert: (parser matches: 'MNPQRSTVW').
	self assert: (parser matches: '-').
	self assert: (parser matches: '?').
	self deny: (parser matches: '8743').
]
