running
testNonLetter

	self assert: (CamelcaseScanner scan: '123456') isEmpty.
	self assert: (CamelcaseScanner scan: 'abc123abc') equals: #('abc' 'abc').