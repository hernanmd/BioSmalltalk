testing
testFaoSpecies

	self assert: (BioSpeciesLists faoSpecies isKindOf: Collection).
	self deny: (BioSpeciesLists faoSpecies isEmpty).
	