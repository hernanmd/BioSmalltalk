running
testEmptyString

	self assert: (CamelcaseScanner scan: '') isEmpty.
	self assert: (CamelcaseScanner scan: '     ') isEmpty.