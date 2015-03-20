testing
testAtMismatchesPut

	| cf |
	
	cf := BioClassifier new.
	cf atMismatchesPut: 1.
	self assert: (cf mismatches bioHasEqualElements: #(1)).
	cf atMismatchesPut: 2.
	self assert: (cf mismatches bioHasEqualElements: #(1 2)).