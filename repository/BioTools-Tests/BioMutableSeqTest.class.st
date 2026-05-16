"
Test class for BioMutableSeq. Validates mutable sequence editing operations including insertion, deletion, and replacement.
"
Class {
	#name : 'BioMutableSeqTest',
	#superclass : 'BioAbstractSequenceTest',
	#category : 'BioTools-Tests-Biological',
	#package : 'BioTools-Tests',
	#tag : 'Biological'
}

{ #category : 'accessing' }
BioMutableSeqTest >> alphabetClass [
	^ self shouldBeImplemented
]

{ #category : 'tests' }
BioMutableSeqTest >> testAppend [
	| testMutSeq1 |
	testMutSeq1 := BioMutableSeq new.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTAC'.
	testMutSeq1 append: 'ACGT'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTACACGT'
]

{ #category : 'tests' }
BioMutableSeqTest >> testAsSequence [

	| testMutSeq1 testSeq1 |

	testMutSeq1 := BioMutableSeq newWith: 'ACTGACGTAC' alphabet: BioIUPACUnambiguousDNA.
	testSeq1 := testMutSeq1 asSequence.

	self deny: (testSeq1 isKindOf: BioMutableSeq).
	self assert: testSeq1 asString equals: 'ACTGACGTAC'.

]

{ #category : 'tests' }
BioMutableSeqTest >> testSetSequence [

	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	self assert: testMutSeq1 isNil.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTAC'.

]
