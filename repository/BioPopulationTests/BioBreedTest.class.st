Class {
	#name : #BioBreedTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'population'
	],
	#category : 'BioPopulationTests'
}

{ #category : #accessing }
BioBreedTest >> population [
	^ population
]

{ #category : #accessing }
BioBreedTest >> population: anObject [
	population := anObject
]

{ #category : #accessing }
BioBreedTest >> setUp [

	population := BioBreed new.
]

{ #category : #testing }
BioBreedTest >> testAddLocation [

	self deny: (self population includesLocation: 'USA').
	self population addLocation: 'USA'.
	self assert: (self population includesLocation: 'USA').

]

{ #category : #testing }
BioBreedTest >> testAddSynonym [

	self deny: self population hasSynonym.
	self population addSynonym: 'H.Sapiens'.
	self assert: self population synonyms first = 'H.Sapiens'.

]

{ #category : #testing }
BioBreedTest >> testAllNames [

	self population removeNullName.
	self assert: self population allNames isEmpty.
	self population 
		addName: 'Homo Sapiens';
		addSynonym: 'H.Sapiens'.
	self assert: self population allNames first = 'Homo Sapiens'.
	self assert: self population allNames second = 'H.Sapiens'.

]

{ #category : #testing }
BioBreedTest >> testDumpCSVTo [

	| fileStream |
	
	fileStream := 'testBioBreedDumpCSVTo.csv' asFileReference writeStream.
	self population
		addName: 'Red deer';
		addSynonym: 'Cervus elaphus';		
		addLocation: 'Szeged';
		addLocation: 'Southern Great Plain';
		dumpCSVTo: fileStream.
	self assert: 'testBioBreedDumpCSVTo.csv' asFileReference exists.
	'testBioBreedDumpCSVTo.csv' asFileReference delete.
]

{ #category : #testing }
BioBreedTest >> testFaoSpecies [

	self assert: (BioSpeciesLists faoSpecies isKindOf: Collection).
	self deny: (BioSpeciesLists faoSpecies isEmpty).
	
]

{ #category : #testing }
BioBreedTest >> testHasSynonym [

	self deny: self population hasSynonym.
	self population addSynonym: 'H.Sapiens'.
	self assert: self population hasSynonym.

]

{ #category : #testing }
BioBreedTest >> testIncludesLocation [

	self deny: (self population includesLocation: 'Nicaragua').
	self population addLocation: 'Nicaragua'.
	self assert: (self population includesLocation: 'Nicaragua').	

]

{ #category : #testing }
BioBreedTest >> testIncludesNameBeginsWith [

	self deny: (self population includesNameBeginsWith: 'bull').
	self population addName: 'Bulldog'.
	self assert: (self population includesNameBeginsWith: 'bull').	

]

{ #category : #testing }
BioBreedTest >> testIsFoundIn [

	self population
		addLocation: 'SE Argentina';
		addLocation: 'N Germany';
		addLocation: 'Bavaria region'.		
	self assert: (self population isFoundIn: 'Argentina').
	self assert: (self population isFoundIn: 'Germany').	
	self assert: (self population isFoundIn: 'bavaria').	
]

{ #category : #'tests-text-mining' }
BioBreedTest >> testLocationPrefixes [

	self 
		assert: self population class locationPrefixes 
		equals: #('S' 'N' 'C' 'W' 'E' 'SW' 'SE' 'NW' 'NE' 'WN' 'WS' 'EN' 'ES' 'NSW' 'to' 'and' 'of' 'region' 'area' 'i.e.')
]

{ #category : #testing }
BioBreedTest >> testLocations [

	self assert: self population locations isEmpty.
	self assert: (self population locations isKindOf: Collection).

]

{ #category : #'tests-text-mining' }
BioBreedTest >> testLocationsWithoutPrefixes [

	self population
		addLocation: 'SE Mexico';
		addLocation: 'N Portugal';
		addLocation: 'China'.
	self assert: (self population locationsWithoutPrefixes bioHasEqualElements: #('Mexico' 'Portugal' 'China'))
]

{ #category : #'tests-text-mining' }
BioBreedTest >> testRemovePrefixes [

	" No prefixes found "
	self assert: ((BioBreed removePrefixes: 'NW') isKindOf: Collection).
	self assert: (BioBreed removePrefixes: 'NW') isEmpty.
	" Remove known prefix "
	self assert: ((BioBreed removePrefixes: 'N Portugal') bioHasEqualElements: 'Portugal').
	" Empty case "
	self assert: ((BioBreed removePrefixes: '') isKindOf: Collection).
	self assert: (BioBreed removePrefixes: '') isEmpty.	
	" null case "
	self should: [ BioBreed removePrefixes: nil ] raise: MessageNotUnderstood.
	" Do not remove unknown prefix "
	self assert: ((BioBreed removePrefixes: 'China') bioHasEqualElements: 'China').
	" Do not remove unknown prefix with several words "
	self assert: ((BioBreed removePrefixes: 'South China') bioHasEqualElements: 'South China').

]

{ #category : #testing }
BioBreedTest >> testRepositoryFor [

	| repoList repositories |
	
	repoList := BioSpeciesLists faoSpecies.
	repositories := repoList reject: [ : repoName | (BioBreed repositoryFor: repoName) isEmpty ].
	repositories do: [ : repo | self assert: (repo isKindOf: BioPopRepository) ]
]

{ #category : #testing }
BioBreedTest >> testRepositoryIsEmpty [

	| repoVersionsList |
	
	repoVersionsList := BioSpeciesLists faoSpecies collect: [: repoName | BioBreed repositoryFor: repoName ].
	repoVersionsList do: [ : repoVersion | 
		self assert: (repoVersion isEmpty isKindOf: Boolean) ].

]

{ #category : #testing }
BioBreedTest >> testRepositoryVersionAt [

	| repoVersionsList populatedRepos |
	
	repoVersionsList := BioSpeciesLists faoSpecies collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		repoVersion repositoryVersionNames do: [: repoName | 
			self assert: ((repoVersion repositoryVersionAt: repoName) isKindOf: BioPopRepositoryVersion) ] ]
]

{ #category : #testing }
BioBreedTest >> testRepositoryVersionNames [

	| repoVersionsList populatedRepos |
	
	repoVersionsList := BioSpeciesLists faoSpecies collect: [: repoName | BioBreed repositoryFor: repoName ].
	populatedRepos := repoVersionsList reject: [ : repoVersion | repoVersion isEmpty ].
	populatedRepos do: [: repoVersion | 
		self assert: (repoVersion repositoryVersionNames isKindOf: Collection).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: (repoName isKindOf: String) ]).
		(repoVersion repositoryVersionNames do: [: repoName | self assert: repoName isEmpty not ]) ]	
		
]

{ #category : #testing }
BioBreedTest >> testSynonyms [

	self assert: self population synonyms isEmpty.
	self assert: (self population synonyms isKindOf: Collection).

]

{ #category : #testing }
BioBreedTest >> testSynonymsCount [

	self deny: self population hasSynonym.
	self population addSynonym: 'H.Sapiens'.
	self assert: self population synonymsCount = 1.

]
