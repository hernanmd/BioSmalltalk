testing
testAsLowercase

	self assert: 'This is A SAMPLE COLLECTION' asLowercase = 'this is a sample collection'.
	self assert: '' asLowercase = ''.
	self assert: #('SAMPLE' 'string' 'For' 'teSTING') asLowercase = #('sample' 'string' 'for' 'testing').
	