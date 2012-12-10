running
testScanWords

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: 'foo bar') asArray = #('foo' 'bar').