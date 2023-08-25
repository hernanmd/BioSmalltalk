Class {
	#name : #BioProteinParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Basic'
}

{ #category : #accessing }
BioProteinParserTest >> setUp [

	super setUp.
	parser := #proteinLetterGapped asPParser.
]

{ #category : #testing }
BioProteinParserTest >> testProteinLetterMatches [

	parser := #proteinLetterGapped asPParser.
	
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
BioProteinParserTest >> testProteinParseEmpty [

	self deny: (parser matches: String empty).

]

{ #category : #testing }
BioProteinParserTest >> testProteinParseLowercaseSequence [

	self assert: (parser matches: 'MNPQRSTVW' asLowercase).

]

{ #category : #testing }
BioProteinParserTest >> testProteinParseLowercaseSingleAminoacid [

	self assert: (parser matches: 'p').

]

{ #category : #testing }
BioProteinParserTest >> testProteinParseNumber [

	self deny: (parser matches: '8743').
]

{ #category : #testing }
BioProteinParserTest >> testProteinParseSingleMismatch [

	self assert: (parser matches: '-').
	self assert: (parser matches: '?').

]

{ #category : #testing }
BioProteinParserTest >> testProteinParseUppercaseSequence [

	self assert: (parser matches: 'MNPQRSTVW').

]

{ #category : #testing }
BioProteinParserTest >> testProteinParseUppercaseSingleAminoacid [

	self assert: (parser matches: 'P').

]
