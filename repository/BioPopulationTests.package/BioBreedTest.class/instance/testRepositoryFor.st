testing
testRepositoryFor

	| repoList repositories |
	
	repoList := BioSpeciesLists faoSpecies.
	repositories := repoList reject: [ : repoName | (BioBreed repositoryFor: repoName) isEmpty ].
	repositories do: [ : repo | self assert: (repo isKindOf: BioPopRepository) ]