Class {
	#name : #BioDNANucleotideParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Basic'
}

{ #category : #accessing }
BioDNANucleotideParserTest >> setUp [

	super setUp.
	parser := #dnaLetter asPParser.

]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNALetterMatchA [

	self assert: (parser matches: 'a').
	self assert: (parser matches: 'A').

]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNALetterMatchC [

	self assert: (parser matches: 'c').
	self assert: (parser matches: 'C').

]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNALetterMatchG [

	self assert: (parser matches: 'g').
	self assert: (parser matches: 'G').

]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNALetterMatchN [

	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').
]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNALetterMatchT [

	self assert: (parser matches: 't').
	self assert: (parser matches: 'T').

]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNANucelotideEmpty [

	self deny: (parser matches: String empty)
]

{ #category : #testing }
BioDNANucleotideParserTest >> testDNANucleotideCharacter [

	self should: [ parser matches: $a ] 		raise: MessageNotUnderstood.
	self should: [ parser matches: nil ] 		raise: MessageNotUnderstood.
]
