running
testDanglingLetter

	self assert: (TermScanner scan: '   a') asArray = #('a').