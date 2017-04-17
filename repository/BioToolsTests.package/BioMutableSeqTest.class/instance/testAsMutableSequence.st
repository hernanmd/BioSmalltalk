testing
testAsMutableSequence

	| testSeq1 |

	self should: [ self sequence sequence: 'actcagtagctagctagtcagc' ] raise: MessageNotUnderstood.

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
