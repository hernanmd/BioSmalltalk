running
testWhitespaceString

	self assert: (TermScanner scan: '               ') isEmpty.

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: '  foo  ') asArray = #('foo').