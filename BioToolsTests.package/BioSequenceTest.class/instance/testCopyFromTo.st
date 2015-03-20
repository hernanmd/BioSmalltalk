testing
testCopyFromTo

	| testSeq1 |

	testSeq1 := self sequence 
					copyFrom: 2 
					to: self sequence size.

	self deny: self sequence = testSeq1.
	self assert: self sequence asString allButFirst = testSeq1 asString.
