testing
testRepositoryFor

	| repoList |
	
	repoList := BioBreed faoSpecies.
	repoList do: [: repoName | 
		self assert: ((BioBreed repositoryFor: repoName) isKindOf: BioPopRepository) ]