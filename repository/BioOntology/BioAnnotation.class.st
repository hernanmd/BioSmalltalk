Class {
	#name : 'BioAnnotation',
	#superclass : 'Object',
	#instVars : [
		'entity',
		'term',
		'qualifier',
		'evidence',
		'source',
		'date',
		'data'
	],
	#category : 'BioOntology-Core',
	#package : 'BioOntology',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioAnnotation class >> entity: anEntity term: aTerm [
	^ self new entity: anEntity; term: aTerm; yourself
]

{ #category : 'instance creation' }
BioAnnotation class >> entity: anEntity term: aTerm qualifier: aQualifier [
	^ self new entity: anEntity; term: aTerm; qualifier: aQualifier; yourself
]

{ #category : 'comparing' }
BioAnnotation >> = other [
	^ self class = other class and: [ entity = other entity and: [ term = other term ] ]

]

{ #category : 'accessing' }
BioAnnotation >> data [
	^ data

]

{ #category : 'accessing' }
BioAnnotation >> dataAt: aKey [
	^ data at: aKey ifAbsent: [nil]

]

{ #category : 'accessing' }
BioAnnotation >> dataAt: aKey put: aValue [
	data at: aKey put: aValue

]

{ #category : 'accessing' }
BioAnnotation >> date [
	^ date

]

{ #category : 'accessing' }
BioAnnotation >> date: aDate [
	date := aDate

]

{ #category : 'accessing' }
BioAnnotation >> entity [
	^ entity

]

{ #category : 'accessing' }
BioAnnotation >> entity: anObject [
	entity := anObject

]

{ #category : 'accessing' }
BioAnnotation >> evidence [
	^ evidence

]

{ #category : 'accessing' }
BioAnnotation >> evidence: aString [
	evidence := aString

]

{ #category : 'comparing' }
BioAnnotation >> hash [
	^ entity hash bitXor: term hash

]

{ #category : 'initialization' }
BioAnnotation >> initialize [
	super initialize.
	data := Dictionary new

]

{ #category : 'printing' }
BioAnnotation >> printOn: aStream [

	aStream nextPutAll: self class name.
	aStream nextPut: $(.
	entity ifNotNil: [ aStream print: entity ].
	aStream space.
	term 
		ifNotNil: [ term id ifNotNil: [ aStream nextPutAll: term id ] ].
	qualifier ifNotNil: [
			aStream
				space;
				nextPutAll: qualifier asString ].
	aStream nextPut: $)
]

{ #category : 'accessing' }
BioAnnotation >> qualifier [
	^ qualifier

]

{ #category : 'accessing' }
BioAnnotation >> qualifier: aSymbol [
	qualifier := aSymbol

]

{ #category : 'accessing' }
BioAnnotation >> source [
	^ source

]

{ #category : 'accessing' }
BioAnnotation >> source: aString [
	source := aString

]

{ #category : 'accessing' }
BioAnnotation >> term [
	^ term

]

{ #category : 'accessing' }
BioAnnotation >> term: aBioOntologyTerm [
	term := aBioOntologyTerm

]
