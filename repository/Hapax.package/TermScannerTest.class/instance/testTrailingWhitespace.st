running
testTrailingWhitespace

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: '  foo  ') asArray = #('foo').