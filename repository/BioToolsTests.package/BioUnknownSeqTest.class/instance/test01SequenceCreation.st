testing
test01SequenceCreation

	self assert: self sequence size = 7.
	self assert: self sequence length = 7.	
	self assert: self sequence asString = 'NNNNNNN'.
