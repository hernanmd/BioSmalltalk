Class {
	#name : #BioAssociationTest,
	#superclass : #BioAbstractTest,
	#category : 'BioToolsTests-Core'
}

{ #category : #testing }
BioAssociationTest >> testAsSequence [

	self assert: (5438 -> 8) asSequence equals: ('ACCCATTC' asSequence alphabet: BioDNAAlphabet new).
	self assert: (5438 -> 7) asSequence equals: ('CCCATTC' asSequence alphabet: BioDNAAlphabet new)	
]
