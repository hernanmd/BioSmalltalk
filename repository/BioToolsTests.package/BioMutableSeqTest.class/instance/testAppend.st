testing
testAppend
	| testMutSeq1 |

	testMutSeq1 := BioMutableSeq new.
	testMutSeq1 sequence: 'ACTGACGTAC'.
	self assert: testMutSeq1 asString = 'ACTGACGTAC'.
	testMutSeq1 append: 'ACGT'.
	self assert: testMutSeq1 asString = 'ACTGACGTACACGT'.
