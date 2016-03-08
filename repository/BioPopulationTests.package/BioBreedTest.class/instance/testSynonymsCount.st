testing
testSynonymsCount

	self deny: self population hasSynonym.
	self population addSynonym: 'H.Sapiens'.
	self assert: self population synonymsCount = 1.
