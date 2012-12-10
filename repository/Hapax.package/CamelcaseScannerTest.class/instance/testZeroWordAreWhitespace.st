running
testZeroWordAreWhitespace

	self assert: (CamelcaseScanner scan: 'foo100Bar') asArray = #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'foo10 0Bar') asArray = #('foo').

	self assert: (CamelcaseScanner scan: '0xFFFF foo') asArray = #('foo').
	self assert: (CamelcaseScanner scan: ' 0xFFFF foo') asArray = #('foo').