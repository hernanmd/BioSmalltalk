Class {
	#name : 'BioCompartment',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'outsideCompartment',
		'data'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'instance creation' }
BioCompartment class >> id: anId name: aName [
	^ self new id: anId; name: aName; yourself
]

{ #category : 'comparing' }
BioCompartment >> = other [
	^ self class = other class and: [ id = other id ]
]

{ #category : 'accessing' }
BioCompartment >> data [
	^ data ifNil: [ data := Dictionary new ]
]

{ #category : 'accessing' }
BioCompartment >> dataAt: aKey [
	^ self data at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioCompartment >> dataAt: aKey put: aValue [
	^ self data at: aKey put: aValue
]

{ #category : 'comparing' }
BioCompartment >> hash [
	^ id ifNil: [ super hash ]
]

{ #category : 'accessing' }
BioCompartment >> id [
	^ id
]

{ #category : 'accessing' }
BioCompartment >> id: anObject [
	id := anObject
]

{ #category : 'accessing' }
BioCompartment >> name [
	^ name
]

{ #category : 'accessing' }
BioCompartment >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
BioCompartment >> outsideCompartment [
	^ outsideCompartment
]

{ #category : 'accessing' }
BioCompartment >> outsideCompartment: aCompartment [
	outsideCompartment := aCompartment
]

{ #category : 'printing' }
BioCompartment >> printOn: aStream [ super printOn: aStream. aStream nextPutAll: ' ('. name ifNotNil: [ aStream nextPutAll: name ]. aStream nextPutAll: ')'
]
