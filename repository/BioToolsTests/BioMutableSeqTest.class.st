Class {
	#name : #BioMutableSeqTest,
	#superclass : #BioAbstractSequenceTest,
	#category : 'BioToolsTests-Biological'
}

{ #category : #testing }
BioMutableSeqTest >> testAppend [
	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString = 'ACTGACGTAC'.
	testMutSeq1 append: 'ACGT'.
	self assert: testMutSeq1 asString = 'ACTGACGTACACGT'.

]

{ #category : #testing }
BioMutableSeqTest >> testAsMutableSequence [

	| testSeq1 |

	self assert: self sequence asString equals: self sampleDnaString01.
	testSeq1 := self sequence asMutableSequence.
	self assert: (testSeq1 isKindOf: BioMutableSeq).
	self assert: (self sequence isKindOf: BioSequence).
	self assert: self sequence asString equals: testSeq1 asString.
	self deny: (self sequence asString == testSeq1 asString).
	self deny: self sequence = testSeq1.
	
	testSeq1 at: 1 put: $T.
	self assert: (testSeq1 at: 1) equals: $T.
	testSeq1 at: 2 put: $G.	
	self assert: (testSeq1 at: 2) equals: $G.

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
