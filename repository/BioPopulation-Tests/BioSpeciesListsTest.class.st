Class {
	#name : #BioSpeciesListsTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'repoList'
	],
	#category : 'BioPopulation-Tests'
}

{ #category : #accessing }
BioSpeciesListsTest >> repoList [
	^ repoList
]

{ #category : #accessing }
BioSpeciesListsTest >> repoList: anObject [
	repoList := anObject
]

{ #category : #testing }
BioSpeciesListsTest >> setUp [
	
	repoList := BioSpeciesLists faoSpecies.
		
]

{ #category : #testing }
BioSpeciesListsTest >> testFaoSpecies [

	self assert: (self repoList isKindOf: Collection).
	self deny: self repoList isEmpty.
	
]

{ #category : #testing }
BioSpeciesListsTest >> testRepositoryIsEmpty [

	| repoVersionsList |
	
	(repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ])
		do: [ : repoVersion | self assert: (repoVersion isEmpty isKindOf: Boolean) ].

]

{ #category : #testing }
BioSpeciesListsTest >> testRepositoryVersionAt [

	| repoVersionsList populatedRepos |
	
	repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		repoVersion repositoryVersionNames do: [: repoName | 
			self assert: ((repoVersion repositoryVersionAt: repoName) isKindOf: BioPopRepositoryVersion) ] ]
]

{ #category : #testing }
BioSpeciesListsTest >> testRepositoryVersionNames [

	| repoVersionsList populatedRepos |
	
	repoVersionsList := self repoList collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		self assert: (repoVersion repositoryVersionNames isKindOf: Collection).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: (repoName isKindOf: String) ]).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: repoName isEmpty not ]) ]	
		
]
