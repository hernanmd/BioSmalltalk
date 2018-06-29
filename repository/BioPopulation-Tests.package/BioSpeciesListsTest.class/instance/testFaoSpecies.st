testing
testFaoSpecies

	self assert: (self repoList isKindOf: Collection).
	self deny: self repoList isEmpty.
	