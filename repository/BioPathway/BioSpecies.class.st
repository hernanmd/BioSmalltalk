"
I represent a physical entity in a biological pathway: a metabolite, gene, protein, RNA or complex. I have identifiers, type, optional compartment, chemical formula, charge, initial concentration, modification state and ontology terms. BioComplex is my subclass for multi-subunit assemblies.
"
Class {
	#name : 'BioSpecies',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'type',
		'compartment',
		'formula',
		'charge',
		'initialConcentration',
		'modificationState',
		'ontologyTerms',
		'data'
	],
	#classVars : [
		'Repositories'
	],
	#classInstVars : [
		'initializeRepositoryOnDemand'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'accessing' }
BioSpecies class >> addRepository: aBioPopRepository [
	" Add aBioPopRepository to the receiver's repository "
	
	self repositories add: aBioPopRepository 
]

{ #category : 'accessing' }
BioSpecies class >> addRepositoryNamed: organismName [
	" Add a <BioPopRepository> for organism organismName to the receiver's repositories "
	
	| repo |
	repo := self newRepositoryForOrganism: organismName.
	self addRepository: repo.
	repo initializeRepositoryVersions	
]

{ #category : 'instance creation' }
BioSpecies class >> gene: aName [
	^ self id: aName name: aName type: #gene
]

{ #category : 'instance creation' }
BioSpecies class >> id: anId name: aName type: aType [
	^ self new id: anId; name: aName; type: aType; yourself
]

{ #category : 'class initialization' }
BioSpecies class >> initialize [
	" Private - initialize species repositories "

	self release.
	BioSpeciesLists currentSpeciesList 
		do: [ : organismName | self addRepositoryNamed: organismName  ]
		displayingProgress: 'Initializing population repositories'.
	self bioLog: 'Imported repositories: ' , self repositories size asString.
]

{ #category : 'initialize-release' }
BioSpecies class >> initializeRepositoryOnDemand [ 

	^ initializeRepositoryOnDemand
		ifNil: [ initializeRepositoryOnDemand := true ]
]

{ #category : 'initialize-release' }
BioSpecies class >> initializeRepositoryOnDemand: anObject [
	initializeRepositoryOnDemand := anObject
]

{ #category : 'instance creation' }
BioSpecies class >> metabolite: aName [
	^ self id: aName name: aName type: #metabolite
]

{ #category : 'initialize-release' }
BioSpecies class >> newRepositoryForOrganism: organismName [
	" Answer a new population repository for organismName "

	^ BioPopRepository new 
		name: organismName;
		yourself
]

{ #category : 'accessing' }
BioSpecies class >> populatedRepositories [
	" Answer a <Collection> of <BioPopRepository> which are already populated  "

	^ self repositories reject: #isEmpty
]

{ #category : 'instance creation' }
BioSpecies class >> protein: aName [
	^ self id: aName name: aName type: #protein
]

{ #category : 'initialize-release' }
BioSpecies class >> release [
	" Private - Initialize the receiver's repository.
	
	self release "

	super release.
	self repositories: nil.
]

{ #category : 'accessing' }
BioSpecies class >> repositories [
	" Answer a <Collection> of <BioPopRepository> " 

	^ Repositories
		ifNil: [ Repositories := OrderedCollection new ]
]

{ #category : 'accessing' }
BioSpecies class >> repositories: aCollection [
	" Set the receiver's repositories to be aCollection "
	
	Repositories := aCollection
]

{ #category : 'accessing' }
BioSpecies class >> repositoryFor: speciesName [
	" Scan population repositories classes for speciesName and answer the corresponding class if found, or raise an exception "
	
	(self repositories isEmpty and: [ self initializeRepositoryOnDemand ])
		ifTrue: [ 
			self initialize.
			BioPopImporter initializeFor: speciesName ].
	^ self repositories detect: [ : repo | repo name = speciesName ]
]

{ #category : 'comparing' }
BioSpecies >> = other [
	^ self class = other class and: [ id = other id ]
]

{ #category : 'adding' }
BioSpecies >> addOntologyTerm: aTerm [
	self ontologyTerms add: aTerm
]

{ #category : 'accessing' }
BioSpecies >> charge [
	^ charge
]

{ #category : 'accessing' }
BioSpecies >> charge: anInteger [
	charge := anInteger
]

{ #category : 'accessing' }
BioSpecies >> compartment [
	^ compartment
]

{ #category : 'accessing' }
BioSpecies >> compartment: aCompartment [
	compartment := aCompartment
]

{ #category : 'accessing' }
BioSpecies >> data [
	^ data ifNil: [ data := Dictionary new ]
]

{ #category : 'accessing' }
BioSpecies >> dataAt: aKey [
	^ self data at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioSpecies >> dataAt: aKey put: aValue [
	^ self data at: aKey put: aValue
]

{ #category : 'accessing' }
BioSpecies >> formula [
	^ formula
]

{ #category : 'accessing' }
BioSpecies >> formula: aString [
	formula := aString
]

{ #category : 'comparing' }
BioSpecies >> hash [ ^ id ifNil: [ super hash ] ifNotNil: [ id hash ]
]

{ #category : 'accessing' }
BioSpecies >> id [
	^ id
]

{ #category : 'accessing' }
BioSpecies >> id: anObject [
	id := anObject
]

{ #category : 'accessing' }
BioSpecies >> initialConcentration [
	^ initialConcentration
]

{ #category : 'accessing' }
BioSpecies >> initialConcentration: aNumber [
	initialConcentration := aNumber
]

{ #category : 'testing' }
BioSpecies >> isComplex [
	^ false
]

{ #category : 'testing' }
BioSpecies >> isGene [
	^ type = #gene
]

{ #category : 'testing' }
BioSpecies >> isMetabolite [
	^ type = #metabolite
]

{ #category : 'testing' }
BioSpecies >> isProtein [
	^ type = #protein
]

{ #category : 'testing' }
BioSpecies >> isRNA [
	^ type = #rna
]

{ #category : 'accessing' }
BioSpecies >> modificationState [
	^ modificationState
]

{ #category : 'accessing' }
BioSpecies >> modificationState: aCollection [
	modificationState := aCollection
]

{ #category : 'accessing' }
BioSpecies >> name [
	^ name
]

{ #category : 'accessing' }
BioSpecies >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
BioSpecies >> ontologyTerms [
	^ ontologyTerms ifNil: [ ontologyTerms := OrderedCollection new ]
]

{ #category : 'printing' }
BioSpecies >> printOn: aStream [ super printOn: aStream. aStream nextPutAll: ' ('. name ifNotNil: [ aStream nextPutAll: name ]. aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioSpecies >> type [
	^ type
]

{ #category : 'accessing' }
BioSpecies >> type: aSymbol [
	type := aSymbol
]
