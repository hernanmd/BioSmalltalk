Class {
	#name : #BioGenIdParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Core'
}

{ #category : #accessing }
BioGenIdParserTest >> setUp [
	" Private - See superimplementor's comment "

	super setUp.
	parser := BioGIParser new.

]

{ #category : #testing }
BioGenIdParserTest >> testTokenizeGenBankIdentifier01 [

	self assert: (self parser tokenize: 'gi|32128012') equals: '32128012'.
	self assert: (self parser tokenize: 'gi|152787') equals: '152787'
]

{ #category : #testing }
BioGenIdParserTest >> testTokenizeGenBankIdentifier02 [

	self
		assert: (self parser tokenize: 'gi')
		equals: 'Error: literal not found'.
	self
		assert: (self parser tokenize: 'gi|')
		equals: 'Error: digit expected'
]
