Class {
	#name : #BioUnknownSeqTest,
	#superclass : #BioAbstractSequenceTest,
	#category : 'BioToolsTests-Biological'
}

{ #category : #accessing }
BioUnknownSeqTest >> alphabetClass [

	^ BioAlphabet
]

{ #category : #accessing }
BioUnknownSeqTest >> setUp [

	super setUp.
	sequence := BioUnknownSeq new: 7
]

{ #category : #testing }
BioUnknownSeqTest >> testAlphabet [

	self assert: ( self sequence alphabet isKindOf: BioAlphabet ).
	self assert: ( self sequence unknownLetter = BioAlphabet new defaultUnknownElement ).
	self sequence unknownLetter: $?.
	self assert: ( self sequence alphabet isKindOf: BioAlphabet ).	
	self assert: self sequence unknownLetter = $?
]

{ #category : #testing }
BioUnknownSeqTest >> testAsString [

	self assert: self sequence asString equals: 'NNNNNNN'.

]

{ #category : #testing }
BioUnknownSeqTest >> testComplementary [

	self assert: self sequence complementary equals: 'NNNNNNN'.

]

{ #category : #testing }
BioUnknownSeqTest >> testReversed [

	self assert: self sequence reversed equals: 'NNNNNNN'.

]

{ #category : #testing }
BioUnknownSeqTest >> testSameSequence [

	self assert: self sequence sameSequence equals: 'NNNNNNN'.

]

{ #category : #testing }
BioUnknownSeqTest >> testSize [

	self assert: self sequence size equals: 7.


]

{ #category : #testing }
BioUnknownSeqTest >> testUnknownLetter [

	self assert: self sequence unknownLetter equals: $N.
	self sequence unknownLetter: $X.
	self assert: self sequence unknownLetter equals: $X.
	

]
