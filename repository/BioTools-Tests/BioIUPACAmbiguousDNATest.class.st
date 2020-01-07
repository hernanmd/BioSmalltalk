"
A BioIUPACAmbiguousDNATest is a test class for testing the behavior of BioIUPACAmbiguousDNA
"
Class {
	#name : #BioIUPACAmbiguousDNATest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACAmbiguousDNATest >> testCodes [

	self assert: (BioIUPACAmbiguousDNA new codes bioHasEqualElements: 'GATCRYWSMKHBVDN' ).
]
