"
A repository version represents a concrete and specific version of a repository. Having the different versions for repository items allow us to revert to a previous version also if required. 

Instance Variables
	bioSpecies:			<Collection>
	locatedBioSpecies:		<Collection>
	repository:			<BioPopRepository>

bioSpecies
	- xxxxx

locatedBioSpecies
	- xxxxx

repository
	- xxxxx

"
Class {
	#name : #BioPopRepositoryVersion,
	#superclass : #BioNamedObject,
	#instVars : [
		'locatedBioSpecies',
		'bioSpecies',
		'repository',
		'importer'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioPopRepositoryVersion class >> detectRepositoryNamed: repoName [
	" Answer a BioPopRepositoryVersion named aString "
	
	^ self allInstances detect: [ : inst | inst name = repoName ]
]

{ #category : #comparing }
BioPopRepositoryVersion >> = anObject [
	"Answer whether the receiver and anObject represent the same object."
	
	^ self class = anObject class and: [ self names = anObject names ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> addBreed: aBioSpecies [

	self bioSpecies add: aBioSpecies
]

{ #category : #accessing }
BioPopRepositoryVersion >> atBreedName: aString [

	^ self locatedBioSpecies 
			detect: [: species | species includesName: aString ]
			ifNone: [ BioNullBreed new ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> bioSpecies [
	^ bioSpecies
		ifNil: [ bioSpecies := OrderedCollection new ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> bioSpecies: anObject [
	bioSpecies := anObject
]

{ #category : #accessing }
BioPopRepositoryVersion >> description [
	" Answer a <String> of a human-friendly description for the receiver "
	
	^ self importer description
]

{ #category : #accessing }
BioPopRepositoryVersion >> importer [

	^ importer
]

{ #category : #accessing }
BioPopRepositoryVersion >> importer: anObject [
	importer := anObject
]

{ #category : #testing }
BioPopRepositoryVersion >> includesBreed: aString [

	^ (self atBreedName: aString) notNil

]

{ #category : #testing }
BioPopRepositoryVersion >> isEmpty [ 

	^ self bioSpecies isEmpty
]

{ #category : #accessing }
BioPopRepositoryVersion >> locatedBioSpecies [
	^ locatedBioSpecies
		ifNil: [ locatedBioSpecies := OrderedCollection new ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> locatedBioSpecies: anObject [
	locatedBioSpecies := anObject
]

{ #category : #accessing }
BioPopRepositoryVersion >> locatedBioSpeciesNames [
	" Answer a <Collection> of <String> each representing receiver's main name "
	
	^ self locatedBioSpecies collect: #name
]

{ #category : #accessing }
BioPopRepositoryVersion >> locatedSpeciesSize [

	^ self locatedBioSpecies size
]

{ #category : #printing }
BioPopRepositoryVersion >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that identifies the receiver."

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title;
		space;	
		nextPutAll: self name between: $( and: $)
]

{ #category : #accessing }
BioPopRepositoryVersion >> removeAll [
	" Remove all species from the receiver's repositories "
	
	self bioSpecies removeAll.
	self locatedBioSpecies removeAll.
]

{ #category : #accessing }
BioPopRepositoryVersion >> repository [
	^ repository
]

{ #category : #accessing }
BioPopRepositoryVersion >> repository: anObject [
	repository := anObject
]

{ #category : #accessing }
BioPopRepositoryVersion >> repositoryDescription [
	" Answer a <String> with a description of source data for the receiver "

	^ self importer repositoryDescription 
]

{ #category : #accessing }
BioPopRepositoryVersion >> repositoryFileSize [
	" Answer a <Number> with the size in bytes of the source data for the receiver "

	^ self importer repositoryFileSize 
]

{ #category : #private }
BioPopRepositoryVersion >> repositoryRawPath [
	" Answer a <String> with the file path of source data for the receiver "

	^ self importer rawDataFilePath 
]

{ #category : #accessing }
BioPopRepositoryVersion >> repositoryVersions [

	^ self versions
]

{ #category : #accessing }
BioPopRepositoryVersion >> size [
	" Answer a <Number> "

	^ self bioSpecies size
]

{ #category : #accessing }
BioPopRepositoryVersion >> speciesAtLocation: aString [
	" Answer a Collection of Breeds in aString location "
	
	^ self locatedBioSpecies select: [: breed | breed isFoundIn: aString ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> speciesWithSynonyms [
	" Answer a <Collection> of receiver's species with non-empty synonyms "
	
	^ self bioSpecies select: #hasSynonym
]

{ #category : #accessing }
BioPopRepositoryVersion >> switchRepositoryStatus [

	self isEmpty
		ifTrue: [ self importer import ]
		ifFalse: [ self bioSpecies: nil. 
			self locatedBioSpecies: nil. ]
]

{ #category : #accessing }
BioPopRepositoryVersion >> updateRepository [

	importer := BioPopImporter versionImporterAt: self name.
	self bioSpecies: nil.
	self locatedBioSpecies: nil.
	importer importFromCsvFile: self requestOpenCSVFile.
	importer initializeLocatedSpecies.
]

{ #category : #accessing }
BioPopRepositoryVersion >> updateUrl [
	" See comment in #updateUrl "
	
	^ self importer updateUrl
]
