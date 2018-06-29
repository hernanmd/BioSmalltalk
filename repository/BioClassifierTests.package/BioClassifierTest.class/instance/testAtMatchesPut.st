testing
testAtMatchesPut

	| cf |
	
	cf := BioClassifier new.
	cf atMatchesPut: 1.
	self assert: (cf atMatches bioHasEqualElements: #(1)).
	cf atMatchesPut: 2.
	self assert: (cf atMatches bioHasEqualElements: #(1 2)).