testing
testMinGCSkewInt

	self assert: ('ACCG' asSequence minGCSkewInt hasEqualElements: #(3)).
	self assert: ('ACCC' asSequence minGCSkewInt hasEqualElements: #(4)).
	self assert: ('CCGGGT' asSequence minGCSkewInt hasEqualElements: #(2)).
	self assert: ('CCGGCCGG' asSequence minGCSkewInt hasEqualElements: #(2 6)).