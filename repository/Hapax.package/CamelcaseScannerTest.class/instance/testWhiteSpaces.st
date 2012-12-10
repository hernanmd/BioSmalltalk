running
testWhiteSpaces
	self assert: (CamelcaseScanner scan: 'foo') asArray = #('foo').
	self assert: (CamelcaseScanner scan: 'fooBar') asArray= #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'FooBar') asArray= #('foo' 'bar').