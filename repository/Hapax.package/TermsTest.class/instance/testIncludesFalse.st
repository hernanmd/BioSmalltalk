running
testIncludesFalse

	terms := Terms sample.

	self assert: (terms includes: 'super') not. 					"not there, but has bucket"
	self assert: (terms includes: '123456789abcdef') not.		"off bounds"
	self assert: (terms includes: '') not.							"off bounds"
	self assert: (terms includes: '123456789') not.				"neither there, nor bucket"
	self assert: (terms includes: nil) not.

	^terms