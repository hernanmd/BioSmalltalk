testing
testHasSynonym

	self deny: self population hasSynonym.
	self population addSynonym: 'H.Sapiens'.
	self assert: self population hasSynonym.
