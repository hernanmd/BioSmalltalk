testing
testAtMatchesPut

	| cf |
	
	cf := BioClassifier new.
	cf atMatchesPut: 1.
	self assert: (cf matches bioHasEqualElements: #(1)).
	cf atMatchesPut: 2.
	self assert: (cf matches bioHasEqualElements: #(1 2)).