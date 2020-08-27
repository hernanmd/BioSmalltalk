Class {
	#name : #BioMutableSeqTest,
	#superclass : #BioAbstractSequenceTest,
	#category : #'BioTools-Tests-Biological'
}

{ #category : #testing }
BioMutableSeqTest >> testAppend [
	| testMutSeq1 |
	testMutSeq1 := BioMutableSeq new.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTAC'.
	testMutSeq1 append: 'ACGT'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTACACGT'
]

{ #category : #testing }
BioMutableSeqTest >> testAsSequence [

	| testMutSeq1 testSeq1 |

	testMutSeq1 := BioMutableSeq newWith: 'ACTGACGTAC' alphabet: BioIUPACUnambiguousDNA.
	testSeq1 := testMutSeq1 asSequence.

	self deny: (testSeq1 isKindOf: BioMutableSeq).
	self assert: testSeq1 asString equals: 'ACTGACGTAC'.

]

{ #category : #testing }
BioMutableSeqTest >> testSetSequence [

	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	self assert: testMutSeq1 isNil.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTAC'.

]
