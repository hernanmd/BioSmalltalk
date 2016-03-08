testing
testSynonyms

	self assert: self population synonyms isEmpty.
	self assert: (self population synonyms isKindOf: Collection).
