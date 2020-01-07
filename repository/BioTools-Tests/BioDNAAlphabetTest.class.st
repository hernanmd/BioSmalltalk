"
A BioDNAAlphabetTest is a test class for testing the behavior of BioDNAAlphabet
"
Class {
	#name : #BioDNAAlphabetTest,
	#superclass : #TestCase,
	#category : #'BioTools-Tests-Alphabets'
}

{ #category : #test }
BioDNAAlphabetTest >> testCanTranslate [

	self assert: BioDNAAlphabet new canTranslate
]
