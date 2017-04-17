testing
testUnknownLetter

	self assert: self sequence unknownLetter equals: $N.
	self sequence unknownLetter: $X.
	self assert: self sequence unknownLetter equals: $X.
	
