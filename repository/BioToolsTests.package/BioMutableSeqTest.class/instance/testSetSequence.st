testing
testSetSequence

	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	self assert: testMutSeq1 isNil.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString equals: 'ACTGACGTAC'.
