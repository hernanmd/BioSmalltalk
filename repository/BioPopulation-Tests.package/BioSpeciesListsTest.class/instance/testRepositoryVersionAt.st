testing
testRepositoryVersionAt

	| repoVersionsList populatedRepos |
	
	repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		repoVersion repositoryVersionNames do: [: repoName | 
			self assert: ((repoVersion repositoryVersionAt: repoName) isKindOf: BioPopRepositoryVersion) ] ]