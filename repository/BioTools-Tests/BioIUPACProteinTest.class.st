"
A BioIUPACProteinTest is a test class for testing the behavior of BioIUPACProtein
"
Class {
	#name : #BioIUPACProteinTest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #test }
BioIUPACProteinTest >> testCanTranslate [

	self deny: BioIUPACProtein new canTranslate 
]

{ #category : #tests }
BioIUPACProteinTest >> testCodes [

	self assert: BioIUPACProtein new codes asSet equals: 'ACDEFGHIKLMNPQRSTVWY' asSet.
]
