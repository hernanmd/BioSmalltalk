"
Acts as a global repository of organisms. Holds a Collection of population repositories  (instances of BioPopRepository).  Can be used wiith BioSpeciesList to to grab names and build its Collection of population repositories.

You can add, remove or query repositories. Populated repositories are those which contains BioPopRepository which are actually populated.

BioSpecies release.
BioSpecies initialize.
BioSpecies repositories.
BioSpecies populatedRepositories.
(BioSpecies repositoryFor: 'Cattle') repositoryVersions.
(BioSpecies repositoryFor: 'Cattle') repositoryVersionAt: 'Mason'.

"
Class {
	#name : #BioSpecies,
	#superclass : #BioNamedObject,
	#classVars : [
		'Repositories'
	],
	#classInstVars : [
		'initializeRepositoryOnDemand'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioSpecies class >> addRepository: aBioPopRepository [
	" Add aBioPopRepository to the receiver's repository "
	
	self repositories add: aBioPopRepository 
]

{ #category : #accessing }
BioSpecies class >> addRepositoryNamed: organismName [
	" Add a <BioPopRepository> for organism organismName to the receiver's repositories "
	
	| repo |
	repo := self newRepositoryForOrganism: organismName.
	self addRepository: repo.
	repo initializeRepositoryVersions	
]

{ #category : #'initialize-release' }
BioSpecies class >> initialize [
	" Private - initialize species repositories "

	self release.
	BioSpeciesLists currentSpeciesList 
		do: [ : organismName | self addRepositoryNamed: organismName  ]
		displayingProgress: 'Initializing population repositories'.
	self bioLog: 'Imported repositories: ' , self repositories size asString.
]

{ #category : #'initialize-release' }
BioSpecies class >> initializeRepositoryOnDemand [

	^ initializeRepositoryOnDemand
		ifNil: [ initializeRepositoryOnDemand := true ]
]

{ #category : #'initialize-release' }
BioSpecies class >> initializeRepositoryOnDemand: anObject [
	initializeRepositoryOnDemand := anObject
]

{ #category : #'initialize-release' }
BioSpecies class >> newRepositoryForOrganism: organismName [
	" Answer a new population repository for organismName "

	^ BioPopRepository new 
		name: organismName;
		yourself
]

{ #category : #accessing }
BioSpecies class >> populatedRepositories [
	" Answer a <Collection> of <BioPopRepository> which are already populated  "

	^ self repositories reject: #isEmpty
]

{ #category : #'initialize-release' }
BioSpecies class >> release [
	" Private - Initialize the receiver's repository.
	
	self release "

	super release.
	self repositories: nil.
]

{ #category : #accessing }
BioSpecies class >> repositories [
	" Answer a <Collection> of <BioPopRepository> "

	^ Repositories
		ifNil: [ Repositories := OrderedCollection new ]
]

{ #category : #accessing }
BioSpecies class >> repositories: aCollection [
	" Set the receiver's repositories to be aCollection "
	
	Repositories := aCollection
]

{ #category : #accessing }
BioSpecies class >> repositoryFor: speciesName [
	" Scan population repositories classes for speciesName and answer the corresponding class if found, or raise an exception "
	
	(self repositories isEmpty and: [ self initializeRepositoryOnDemand ])
		ifTrue: [ 
			self initialize.
			BioPopImporter initializeFor: speciesName ].
	^ self repositories detect: [ : repo | repo name = speciesName ]
]
