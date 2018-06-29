testing
testAtMatches

	| cf |
	
	cf := BioClassifier new.
	self assert: (cf atMatches isKindOf: Collection).
	self assert: cf atMatches isEmpty.
	cf atMatchesPut: 1.
	self deny: cf atMatches isEmpty.	
	self assert: (cf atMatches isKindOf: Collection).
	cf atMatchesPut: 2.
	self assert: cf atMatches size equals: 2