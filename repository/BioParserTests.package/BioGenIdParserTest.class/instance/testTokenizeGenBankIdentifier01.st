testing
testTokenizeGenBankIdentifier01

	self assert: (self parser tokenize: 'gi|32128012') = '32128012'.
	self assert: (self parser tokenize: 'gi|152787') = '152787'.
	
	self assert: (self parser tokenize: 'gi') = 'Error: ''gi|'' expected'.
	self assert: (self parser tokenize: 'gi|') =  'Error: digit expected'.
