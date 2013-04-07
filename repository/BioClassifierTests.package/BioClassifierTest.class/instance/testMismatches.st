testing
testMismatches

	| cf |
	
	cf := BioClassifier new.
	self assert: (cf mismatches isKindOf: Collection).
	self assert: cf mismatches isEmpty.
	cf atMismatchesPut: 1.
	self deny: cf mismatches isEmpty.	
	self assert: (cf mismatches isKindOf: Collection).
	self assert: (cf mismatches bioHasEqualElements: #(1)).
	cf atMismatchesPut: 2.
	self assert: (cf mismatches bioHasEqualElements: #(1 2)).