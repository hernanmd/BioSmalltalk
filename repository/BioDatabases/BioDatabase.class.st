Class {
	#name : 'BioDatabase',
	#superclass : 'Object',
	#instVars : [
		'type',
		'category',
		'name',
		'description',
		'url',
		'status'
	],
	#category : 'BioDatabases',
	#package : 'BioDatabases'
}

{ #category : 'as yet unclassified' }
BioDatabase class >> type: aType category: aCat name: aName description: aDesc [

	^ self new
		  type: aType;
		  category: aCat;
		  name: aName;
		  description: aDesc;
		  yourself
]

{ #category : 'as yet unclassified' }
BioDatabase class >> type: aType category: aCat name: aName description: aDesc url: aUrl [	^ self new type: aType; category: aCat; name: aName; description: aDesc; url: aUrl; yourself
]

{ #category : 'accessing' }
BioDatabase >> category [

	^ category
]

{ #category : 'accessing' }
BioDatabase >> category: aString [

	category := aString
]

{ #category : 'accessing' }
BioDatabase >> description [

	^ description
]

{ #category : 'accessing' }
BioDatabase >> description: aString [

	description := aString
]

{ #category : 'accessing' }
BioDatabase >> name [

	^ name
]

{ #category : 'accessing' }
BioDatabase >> name: aString [

	name := aString
]

{ #category : 'printing' }
BioDatabase >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' ('.
	name ifNotNil: [ aStream nextPutAll: name ].
	aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioDatabase >> status [ ^ status
]

{ #category : 'accessing' }
BioDatabase >> status: anObject [

	status := anObject
]

{ #category : 'accessing' }
BioDatabase >> type [

	^ type
]

{ #category : 'accessing' }
BioDatabase >> type: aSymbol [

	type := aSymbol
]

{ #category : 'accessing' }
BioDatabase >> url [

	^ url
]

{ #category : 'accessing' }
BioDatabase >> url: aString [

	url := aString
]
