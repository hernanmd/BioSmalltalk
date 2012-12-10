running
testIncludesTrue

	terms := Terms sample.

	self assert: (terms includes: 'tree').
	self assert: (terms includes: 'a').				"first bucket"
	self assert: (terms includes: 'connectivity').	"last bucket"
	self assert: (terms includes: 'the').							
	self assert: (terms includes: 'graph').	

	^terms