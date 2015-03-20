testing
testSequences03

	align := self sampleAlignment01.	
	self assert: ( align sequences isKindOf: Collection ).
	self deny: align sequences isEmpty.
