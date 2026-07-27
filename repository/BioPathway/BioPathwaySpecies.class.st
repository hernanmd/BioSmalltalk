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
	#name : 'BioPathwaySpecies',
	#superclass : 'BioNamedObject',
	#instVars : [
		'charge',
		'id',
		'type',
		'modificationState',
		'initialConcentration',
		'formula',
		'ontologyTerms',
		'data',
		'compartment'
	],
	#classVars : [
		'Repositories'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'instance creation' }
BioPathwaySpecies class >> gene: aName [
	^ self id: aName name: aName type: #gene
]

{ #category : 'instance creation' }
BioPathwaySpecies class >> id: anId name: aName type: aType [

	^ self new
		  id: anId;
		  name: aName;
		  type: aType;
		  yourself
]

{ #category : 'instance creation' }
BioPathwaySpecies class >> metabolite: aName [

	^ self id: aName name: aName type: #metabolite
]

{ #category : 'instance creation' }
BioPathwaySpecies class >> protein: aName [

	^ self id: aName name: aName type: #protein
]

{ #category : 'comparing' }
BioPathwaySpecies >> = other [
	^ self class = other class and: [ id = other id ]
]

{ #category : 'adding' }
BioPathwaySpecies >> addOntologyTerm: aTerm [
	self ontologyTerms add: aTerm
]

{ #category : 'accessing' }
BioPathwaySpecies >> charge [

	^ charge
]

{ #category : 'accessing' }
BioPathwaySpecies >> charge: anInteger [
	charge := anInteger
]

{ #category : 'accessing' }
BioPathwaySpecies >> compartment [

	^ compartment
]

{ #category : 'accessing' }
BioPathwaySpecies >> compartment: aCompartment [
	compartment := aCompartment
]

{ #category : 'accessing' }
BioPathwaySpecies >> data [
	^ data ifNil: [ data := Dictionary new ] 
]

{ #category : 'accessing' }
BioPathwaySpecies >> dataAt: aKey [
	^ self data at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioPathwaySpecies >> dataAt: aKey put: aValue [
	^ self data at: aKey put: aValue
]

{ #category : 'accessing' }
BioPathwaySpecies >> formula [

	^ formula
]

{ #category : 'accessing' }
BioPathwaySpecies >> formula: aString [
	formula := aString
]

{ #category : 'comparing' }
BioPathwaySpecies >> hash [ ^ id ifNil: [ super hash ] ifNotNil: [ id hash ]
]

{ #category : 'accessing' }
BioPathwaySpecies >> id [
	^ id
]

{ #category : 'accessing' }
BioPathwaySpecies >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
BioPathwaySpecies >> initialConcentration [
	^ initialConcentration
]

{ #category : 'accessing' }
BioPathwaySpecies >> initialConcentration: aNumber [

	initialConcentration := aNumber
]

{ #category : 'testing' }
BioPathwaySpecies >> isComplex [
	^ false
]

{ #category : 'testing' }
BioPathwaySpecies >> isGene [
	^ type = #gene
]

{ #category : 'testing' }
BioPathwaySpecies >> isMetabolite [

	^ type = #metabolite
]

{ #category : 'testing' }
BioPathwaySpecies >> isProtein [
	^ type = #protein
]

{ #category : 'testing' }
BioPathwaySpecies >> isRNA [
	^ type = #rna
]

{ #category : 'accessing' }
BioPathwaySpecies >> modificationState [

	^ modificationState
]

{ #category : 'accessing' }
BioPathwaySpecies >> modificationState: aCollection [
	modificationState := aCollection
]

{ #category : 'accessing' }
BioPathwaySpecies >> ontologyTerms [

	^ ontologyTerms ifNil: [ ontologyTerms := OrderedCollection new ]
]

{ #category : 'printing' }
BioPathwaySpecies >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' ('.
	self name 
		ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioPathwaySpecies >> type [
	^ type
]

{ #category : 'accessing' }
BioPathwaySpecies >> type: aSymbol [
	type := aSymbol
]
