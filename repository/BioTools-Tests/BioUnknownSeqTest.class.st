"
Test class for BioUnknownSeq. Validates unknown sequence length handling and behavior.
"
Class {
	#name : 'BioUnknownSeqTest',
	#superclass : 'BioAbstractSequenceTest',
	#category : 'BioTools-Tests-Biological',
	#package : 'BioTools-Tests',
	#tag : 'Biological'
}

{ #category : 'accessing' }
BioUnknownSeqTest >> alphabetClass [

	^ BioAlphabet
]

{ #category : 'accessing' }
BioUnknownSeqTest >> setUp [

	super setUp.
	sequence := BioUnknownSeq new: 7
]

{ #category : 'tests' }
BioUnknownSeqTest >> testAlphabet [

	self assert: (self sequence alphabet isKindOf: BioAlphabet).
	self
		assert: self sequence unknownLetter
		equals: BioAlphabet new defaultUnknownElement.
	self sequence unknownLetter: $?.
	self assert: (self sequence alphabet isKindOf: BioAlphabet).
	self assert: self sequence unknownLetter equals: $?
]

{ #category : 'tests' }
BioUnknownSeqTest >> testAsString [

	self assert: self sequence asString equals: 'NNNNNNN'.

]

{ #category : 'tests' }
BioUnknownSeqTest >> testComplementary [

	self assert: self sequence complementary equals: 'NNNNNNN'.

]

{ #category : 'tests' }
BioUnknownSeqTest >> testReversed [

	self assert: self sequence reversed equals: 'NNNNNNN'.

]

{ #category : 'tests' }
BioUnknownSeqTest >> testSameSequence [

	self assert: self sequence sameSequence equals: 'NNNNNNN'.

]

{ #category : 'tests' }
BioUnknownSeqTest >> testSize [

	self assert: self sequence size equals: 7.


]

{ #category : 'tests' }
BioUnknownSeqTest >> testUnknownLetter [

	self assert: self sequence unknownLetter equals: $N.
	self sequence unknownLetter: $X.
	self assert: self sequence unknownLetter equals: $X.
	

]
