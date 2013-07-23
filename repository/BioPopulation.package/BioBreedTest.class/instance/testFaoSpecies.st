testing
testFaoSpecies

	self assert: (BioBreed faoSpecies isKindOf: Collection).
	self deny: (BioBreed faoSpecies isEmpty).
	