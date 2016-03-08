testing
testIncludesNameBeginsWith

	self deny: (self population includesNameBeginsWith: 'bull').
	self population addName: 'Bulldog'.
	self assert: (self population includesNameBeginsWith: 'bull').	
