Class {
	#name : #BioDNASequenceParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Basic'
}

{ #category : #accessing }
BioDNASequenceParserTest >> setUp [

	super setUp.
	parser := #dnaSequence asPParser.

]

{ #category : #testing }
BioDNASequenceParserTest >> testDNASeqMatchString [

	self assert: (parser matches: 'actg').
	self assert: (parser matches: 'ACTG').	

]

{ #category : #testing }
BioDNASequenceParserTest >> testDNASeqMatches [

	self assert: (parser matches: 'a').
	self assert: (parser matches: 'A').
	self assert: (parser matches: 'N').
	self assert: (parser matches: 'n').

]

{ #category : #testing }
BioDNASequenceParserTest >> testDNASeqNumber [

	self deny: (parser matches: '8743').
]

{ #category : #testing }
BioDNASequenceParserTest >> testDNASeqParseEmpty [

	self deny: (parser matches: String empty).

]
