testing
testRepositoryIsEmpty

	| repoVersionsList |
	
	repoVersionsList := BioSpeciesLists faoSpecies collect: [: repoName | BioBreed repositoryFor: repoName ].
	repoVersionsList do: [ : repoVersion | 
		self assert: (repoVersion isEmpty isKindOf: Boolean) ].
