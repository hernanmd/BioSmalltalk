"
A BioIUPACUnambiguousDNATest is a test class for testing the behavior of BioIUPACUnambiguousDNA
"
Class {
	#name : #BioIUPACUnambiguousDNATest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACUnambiguousDNATest >> testCodes [

	self assert: (BioIUPACUnambiguousDNA new codes bioHasEqualElements: 'GATCN').
]
