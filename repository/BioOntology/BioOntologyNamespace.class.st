Class {
	#name : 'BioOntologyNamespace',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'description'
	],
	#category : 'BioOntology-Core',
	#package : 'BioOntology',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioOntologyNamespace class >> id: anId name: aName [
	^ self new id: anId; name: aName; yourself
]

{ #category : 'instance creation' }
BioOntologyNamespace class >> id: anId name: aName description: aDescription [
	^ self new id: anId; name: aName; description: aDescription; yourself
]

{ #category : 'as yet unclassified' }
BioOntologyNamespace class >> withId: anId [ ^ self new id: anId; yourself
]

{ #category : 'accessing' }
BioOntologyNamespace >> description [
	^ description

]

{ #category : 'accessing' }
BioOntologyNamespace >> description: aString [
	description := aString

]

{ #category : 'accessing' }
BioOntologyNamespace >> id [
	^ id

]

{ #category : 'accessing' }
BioOntologyNamespace >> id: aString [
	id := aString

]

{ #category : 'accessing' }
BioOntologyNamespace >> name [
	^ name

]

{ #category : 'accessing' }
BioOntologyNamespace >> name: aString [
	name := aString

]

{ #category : 'printing' }
BioOntologyNamespace >> printOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPut: $(.
	id ifNotNil: [aStream nextPutAll: id].
	aStream nextPut: $)

]
