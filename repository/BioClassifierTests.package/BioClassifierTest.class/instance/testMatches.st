testing
testMatches

	| cf |
	
	cf := BioClassifier new.
	self assert: (cf matches isKindOf: Collection).
	self assert: cf matches isEmpty.
	cf atMatchesPut: 1.
	self deny: cf matches isEmpty.	
	self assert: (cf matches isKindOf: Collection).
	cf atMatchesPut: 2.
	self assert: cf matches size equals: 1