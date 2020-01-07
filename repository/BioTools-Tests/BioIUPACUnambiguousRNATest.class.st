"
A BioIUPACUnambiguousRNATest is a test class for testing the behavior of BioIUPACUnambiguousRNA
"
Class {
	#name : #BioIUPACUnambiguousRNATest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACUnambiguousRNATest >> testCodes [

	self assert: BioIUPACUnambiguousRNA new codes asSet equals: 'GAUC' asSet.
]
