running
testDanglingLetter

	self assert: (CamelcaseScanner scan: 'a') equals: #('a').
	self assert: (CamelcaseScanner scan: 'A') equals:#('A').
	self assert: (CamelcaseScanner scan: 'fooA') equals: #('foo' 'A').