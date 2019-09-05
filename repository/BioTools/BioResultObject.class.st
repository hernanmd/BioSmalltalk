"
A result object is a wrapper for results.

A result object uses a reader to fetch its contents.

Other responsibilities includes triggering activation of remote queries, by sending a message to its client.

It also contains an exit status which you may query by sending the #status message. Value <true> means the query executed successfully and <false> otherwise.

"
Class {
	#name : #BioResultObject,
	#superclass : #BioNamedObject,
	#instVars : [
		'updater',
		'history',
		'project',
		'result',
		'formatters',
		'exitStatus',
		'command'
	],
	#category : #'BioTools-Query'
}

{ #category : #accessing }
BioResultObject class >> accept: anObject [
	" Answer <true> if anObject can be instantiated with the receiver "

	^ anObject respondsTo: #addResult:.
]

{ #category : #'instance creation' }
BioResultObject class >> for: aBioGBSeqCollection [

	^ aBioGBSeqCollection isEmpty 	
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [ self halt. BioNCBIGenBankResult new ]
]

{ #category : #'instance creation' }
BioResultObject class >> newFrom: aCollection [
	" Answer a new instance of the receiver using aCollection as result. "
	
	^ self new filter: aCollection
]

{ #category : #'instance creation' }
BioResultObject class >> on: aCollection [
	" Answer a new instance of the receiver using aCollection as result "
	
	^ self new result: aCollection
]

{ #category : #comparing }
BioResultObject >> = anObject [
	"Answer whether the receiver and anObject represent the same object."
	" Two search results are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the size and name.
	 (c) for each result, they have the same result object "

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	^ self result = anObject result.

]

{ #category : #'accessing private' }
BioResultObject >> beFailed [
	" Set the receiver's last operation status to failed "
	
	self status: false
]

{ #category : #'accessing private' }
BioResultObject >> beSuccess [
	" Set the receiver's last operation status to failed "
	
	self status: true
]

{ #category : #accessing }
BioResultObject >> command [
	" Answer a <String> with the receiver's launched command "

	^ command
]

{ #category : #accessing }
BioResultObject >> command: aString [
	" Set the receiver's command to be aString "

	command := aString
]

{ #category : #accessing }
BioResultObject >> contents [
	" Answer a <String> with the receiver's result object "
	
	^ self result contents "results"
]

{ #category : #'accessing private' }
BioResultObject >> definitionString [
	" Answer a descriptive <String> for the receiver "

	^ 'Result'
]

{ #category : #iterating }
BioResultObject >> do: aBlock [
	"Refer to the comment in Collection|do:."
	
	^ result do: aBlock
]

{ #category : #accessing }
BioResultObject >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "

	aStream nextPutAll: self result
]

{ #category : #accessing }
BioResultObject >> formatters [
	" Answer a <Collection> of <BioFormatter> "
	
	^ formatters
		ifNil: [ formatters := OrderedCollection new ]
]

{ #category : #accessing }
BioResultObject >> formatters: aCollection [

	^ formatters := aCollection
]

{ #category : #comparing }
BioResultObject >> hash [
	" Answer an <Integer> that is related to the identity of the receiver. "

	^ self result hash bitXor: self names hash
]

{ #category : #accessing }
BioResultObject >> history [

	^ history
]

{ #category : #accessing }
BioResultObject >> history: anObject [

	history := anObject
]

{ #category : #'initialize-release' }
BioResultObject >> initialize [
	" Private - Initialize receiver's metadata "
	
	super initialize.
	self name: self definitionString , ' created at ' , date asString.
	self beSuccess.

]

{ #category : #testing }
BioResultObject >> isEmpty [
	" Answer whether the receiver contains any elements "
		
	^ self result isEmpty
]

{ #category : #testing }
BioResultObject >> isEntrezSearchResult [
	" Answer <true> if receiver represents a result obtained through Entrez system "
	
	^ false
]

{ #category : #accessing }
BioResultObject >> newFilter [
	" Answer a Filter object over the receiver's reader "
	
	^ self resultReader newFilter
]

{ #category : #testing }
BioResultObject >> notEmpty [
	"Answer whether the receiver contains any elements."

	^ self result notNil and: [ self notEmpty ]
]

{ #category : #accessing }
BioResultObject >> project [
	" Answer the receiver's project - See class comments for details "
	
	^ project
]

{ #category : #accessing }
BioResultObject >> project: aBioProject [
	" Set the receiver's project - See class comments for details "

	project := aBioProject
]

{ #category : #accessing }
BioResultObject >> readerClass [

	^ BioBasicReader
]

{ #category : #accessing }
BioResultObject >> result [
	" Answer the receiver's result object "

	^ result
]

{ #category : #accessing }
BioResultObject >> result: anObject [
	result := anObject
]

{ #category : #accessing }
BioResultObject >> resultReader [

	^ result
]

{ #category : #accessing }
BioResultObject >> size [
	"Answer how many elements the receiver contains."
	
	^ self result size
]

{ #category : #accessing }
BioResultObject >> status [
	" Answer a <Boolean> with the exit status of the receiver "

	^ exitStatus
]

{ #category : #accessing }
BioResultObject >> status: aBoolean [
	" Set aBoolean as the exit status of the receiver "

	exitStatus := aBoolean
]

{ #category : #accessing }
BioResultObject >> updater [
	^ updater
]

{ #category : #accessing }
BioResultObject >> updater: anObject [
	updater := anObject
]
