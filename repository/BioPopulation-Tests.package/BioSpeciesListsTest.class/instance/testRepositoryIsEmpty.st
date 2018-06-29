testing
testRepositoryIsEmpty

	| repoVersionsList |
	
	(repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ])
		do: [ : repoVersion | self assert: (repoVersion isEmpty isKindOf: Boolean) ].
