testing
testRepositoryVersionNames

	| repoVersionsList populatedRepos |
	
	repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		self assert: (repoVersion repositoryVersionNames isKindOf: Collection).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: (repoName isKindOf: String) ]).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: repoName isEmpty not ]) ]	
		