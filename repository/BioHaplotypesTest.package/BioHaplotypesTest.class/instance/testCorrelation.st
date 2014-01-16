testing
testCorrelation

	self assert: (self haploBlock1 correlation isKindOf: Float).
	self assert: self haploBlock1 correlation = 0.95.	

	self haploBlock1 correlation: 0.97.
	self assert: self haploBlock1 correlation = 0.97.
	
