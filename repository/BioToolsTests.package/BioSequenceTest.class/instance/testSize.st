testing
testSize

	self assert: (self sequence size isKindOf: Integer).
	self assert: self sequence size = self sampleDnaString01 size.
	self assert: self sequence length = self sampleDnaString01 size.	
