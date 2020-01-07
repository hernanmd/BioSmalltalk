"
A BioIUPACAmbiguousRNATest is a test class for testing the behavior of BioIUPACAmbiguousRNA
"
Class {
	#name : #BioIUPACAmbiguousRNATest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACAmbiguousRNATest >> testCodes [

	self assert: BioIUPACAmbiguousRNA new codes asSet equals: 'GAUCRYWSMKHBVDN' asSet.
]
