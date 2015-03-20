testing
testAppendSequence

	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	testMutSeq1 seq: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString = 'ACTGACGTAC'.
	testMutSeq1 append: 'ACGT'.
	self assert: testMutSeq1 asString = 'ACTGACGTACACGT'.
