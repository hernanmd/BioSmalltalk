testing
testRepositoryIsEmpty

	| repoVersionsList |
	
	repoVersionsList := BioBreed faoSpecies collect: [: repoName | BioBreed repositoryFor: repoName ].
	repoVersionsList do: [ : repoVersion | 
		self assert: (repoVersion isEmpty isKindOf: Boolean) ].
