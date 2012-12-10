running
testNonLetter

	self assert: (TermScanner scan: '123456') isEmpty.
	self assert: (TermScanner scan: 'abc123abc') asArray = #('abc' 'abc').