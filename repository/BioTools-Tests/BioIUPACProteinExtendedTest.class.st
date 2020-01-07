"
A BioIUPACProteinExtendedTest is a test class for testing the behavior of BioIUPACProteinExtended
"
Class {
	#name : #BioIUPACProteinExtendedTest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACProteinExtendedTest >> testCodes [

	self assert: BioIUPACProteinExtended new codes asSet equals: 'ACDEFGHIKLMNPQRSTVWYBXZJUO' asSet.
]
