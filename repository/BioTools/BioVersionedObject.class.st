"
A BioVersionedObject holds state related with receiver's author, date of creation and a <Collection> of receiver's additional versions.

Instance Variables
	creator:		<Object>
	date:		<Date>
	versions:	<BioVersionedObject>


"
Class {
	#name : #BioVersionedObject,
	#superclass : #BioObject,
	#instVars : [
		'versions',
		'date',
		'author'
	],
	#category : #'BioTools-Core'
}

{ #category : #accessing }
BioVersionedObject >> author [
	" Answer an object responsible of the receiver's creation or maintenance "

	^ author
]

{ #category : #accessing }
BioVersionedObject >> author: anObject [
	" Set the receiver's responsible for creation/maintenance "
	
	author := anObject
]

{ #category : #accessing }
BioVersionedObject >> date [
	^ date
]

{ #category : #accessing }
BioVersionedObject >> date: anObject [
	date := anObject
]

{ #category : #testing }
BioVersionedObject >> hasVersions [
	" Answer <true> if the receiver was versioned "

	^ self versions isNotEmpty
]

{ #category : #initialization }
BioVersionedObject >> initialize [
	" Private - Initialize receiver's versioning information "
	
	super initialize.
	versions := OrderedCollection new.
	date := self dateClass now.	
]

{ #category : #accessing }
BioVersionedObject >> versions [
	^ versions
]

{ #category : #accessing }
BioVersionedObject >> versions: anObject [
	versions := anObject
]
