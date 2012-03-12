testing
testCopyUpToStartParenthesis

	self assert: 'this is a (test)' copyUpToStartParenthesis = 'this is a'.
	self assert: 'this is another (test) (with several) parenthesis' copyUpToStartParenthesis = 'this is another'.
	self assert: 'string without parenthesis' copyUpToStartParenthesis = 'string without parenthesis'.
	self assert: String empty copyUpToStartParenthesis = String empty.
