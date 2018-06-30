testing
testSize

	self assert: (self sequence size isKindOf: Integer).
	self assert: self sequence size equals: self sampleDnaString01 size.
	self assert: self sequence length equals: self sampleDnaString01 size.	
