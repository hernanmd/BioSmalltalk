"
Acts as a repository of organism population. It supports the following features: 

- Repository stores repository versions objects (instances of BioPopRepositoryVersion).
- Supports importing records from an ""Importer Class""
- Supports retrieval of 
-- Repository descriptions
-- Repository version names 

"
Class {
	#name : #BioPopRepository,
	#superclass : #BioNamedObject,
	#instVars : [
		'repositoryVersions'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioPopRepository >> addRepositoryVersion: aRepositoryVersion [
	" Add a aRepositoryVersion to the receiver's versions "
	
	repositoryVersions ifNil: [ repositoryVersions := Set new ].
	repositoryVersions add: aRepositoryVersion
]

{ #category : #accessing }
BioPopRepository >> addRepositoryVersionFromImporter: repositoryImporterClass [
	" Add a repositoryImporterClass to the receiver's versions "
	
	repositoryVersions isNil
		ifTrue: [ repositoryVersions := Set new ].
	repositoryVersions add: (self newRepositoryVersionFrom: repositoryImporterClass)
]

{ #category : #displaying }
BioPopRepository >> displayString [

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: self name; space;
			nextPut: $(;
			nextPutAll: self repositoryVersions size asString;
			nextPut:$) ]
]

{ #category : #initialize }
BioPopRepository >> initializeRepositoryVersions [

	self names do: [ : aName |
		BioPopImporter initializeFor: aName ].

]

{ #category : #testing }
BioPopRepository >> isEmpty [
	" Answer <true> if receiver's does not contains any repository version "

	^ self repositoryVersions isNil or: [ self repositoryVersions isEmpty ]
]

{ #category : #accessing }
BioPopRepository >> newRepositoryVersionFrom: repositoryImporterClass [

	^ BioPopRepositoryVersion new 
		repository: self; 
		importer: repositoryImporterClass;
		name: repositoryImporterClass repositoryName
]

{ #category : #printing }
BioPopRepository >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title;
		space.
	aStream nextPutAll: self name between: $( and: $)
]

{ #category : #accessing }
BioPopRepository >> removeRepositoryVersions [
	" Set to nil to re-scan and populate repositories "

	repositoryVersions := nil
]

{ #category : #accessing }
BioPopRepository >> repositoryDescriptions [

	self repositoryVersions isEmpty 
		ifTrue: [ self initializeRepositoryVersions ].
	^ self repositoryVersions collect: #name
]

{ #category : #accessing }
BioPopRepository >> repositoryVersionAt: aRepoVersionName [

	^ self repositoryVersions detect:[: repoVersions | 
		repoVersions name = aRepoVersionName ]
]

{ #category : #accessing }
BioPopRepository >> repositoryVersionNames [
	" Answer a <Collection> with names of repository for the receiver "
	
	^ self repositoryVersions collect: #name
]

{ #category : #accessing }
BioPopRepository >> repositoryVersions [
	" Answer a <Collection> of repository containers and populate them if they are configured for import on demand "

	^ repositoryVersions
		ifNil: [ 
			self initializeRepositoryVersions.
			repositoryVersions ]
]

{ #category : #accessing }
BioPopRepository >> repositoryVersions: anObject [
	^ repositoryVersions := anObject
]
