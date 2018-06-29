testing
testRepositoryFor

	self repoList do: [: repoName | 
		self assert: ((BioBreed repositoryFor: repoName) isKindOf: BioPopRepository) ]