"
A BioIUPACDNAExtendedTest is a test class for testing the behavior of BioIUPACDNAExtended
"
Class {
	#name : #BioIUPACDNAExtendedTest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #tests }
BioIUPACDNAExtendedTest >> testCodes [

	self assert: (BioIUPACDNAExtended new codes bioHasEqualElements: 'GATCBDSW').
]
