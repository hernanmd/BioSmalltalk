Class {
	#name : #BioGenIdParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #testing }
BioGenIdParserTest >> setUp [
	" Private - See superimplementor's comment "

	super setUp.
	parser := BioGIParser new.

]

{ #category : #testing }
BioGenIdParserTest >> testTokenizeGenBankIdentifier01 [

	self assert: (self parser tokenize: 'gi|32128012') = '32128012'.
	self assert: (self parser tokenize: 'gi|152787') = '152787'.
	
	self assert: (self parser tokenize: 'gi') = 'Error: ''gi|'' expected'.
	self assert: (self parser tokenize: 'gi|') =  'Error: digit expected'.

]
