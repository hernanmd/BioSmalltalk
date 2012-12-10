running
testOccurrencesOf

	terms := Terms sample.

	self assert: (terms occurrencesOf: 'tree') = 5.
	self assert: (terms occurrencesOf: 'a') = 6.				
	self assert: (terms occurrencesOf: 'connectivity') = 1.	
	self assert: (terms occurrencesOf: 'the') = 2.							
	self assert: (terms occurrencesOf: 'graph') = 1.	
	^terms