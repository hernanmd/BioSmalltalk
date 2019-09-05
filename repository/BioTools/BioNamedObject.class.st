"
a named object holds a Collection of names. The first name is the preferredName and is the answer of the #name message. If the object is not named then answer a null name, defined in the method #nullName.

Adding a duplicate name raises an exception.
"
Class {
	#name : #BioNamedObject,
	#superclass : #BioVersionedObject,
	#instVars : [
		'names'
	],
	#category : #'BioTools-Core'
}

{ #category : #'instance creation' }
BioNamedObject class >> newNamed: aString [
	" Answer a new instance of the receiver named aNameString. "
	
	^ self new 
		name: aString;
		yourself
]

{ #category : #accessing }
BioNamedObject class >> uniqueName [
	" Answer a <String> intended to represent a unique identifier "
	
	^ String streamContents: [ : stream |
		stream 
			nextPut: $-;
			nextPutAll: UUID new asString36 ]
	
]

{ #category : #comparing }
BioNamedObject >> = anObject [
	" Answer whether the receiver and anObject represent the same object. "
	
	^ self == anObject and: [ self class = anObject class and: [ self names = anObject names ] ]
]

{ #category : #accessing }
BioNamedObject >> addName: aString [
	" Add aString as a name of the receiver. "
	
	^ (self names includes: aString)
		ifFalse: [ 
			self names addLast: aString.
			self removeNullName ]
		ifTrue: [ self signalDuplicateObject: aString , ' already exists in the receiver' translated ]
]

{ #category : #accessing }
BioNamedObject >> addUniqueName: aString [
	" Add aString as an unique name of the receiver. "
	
	names := self nameClass with: aString.


]

{ #category : #accessing }
BioNamedObject >> alphaName [
	" Answer the first receiver's name which is alphabetic. If not found answer the receiver's null name  "
	
	^ self names 
			detect: [ : aName | aName isString and: [ aName isAllDigits not ] ]
			ifNone: [ self nullName ]
]

{ #category : #testing }
BioNamedObject >> hasName [
	" Answer <true> if the receiver has any name "
	
	^ (names isNil or: [ self names isEmpty or: [ self names anySatisfy: #isEmpty ] ]) not
]

{ #category : #comparing }
BioNamedObject >> hash [
	" hash is implemented because #= is implemented "

	^ self names hash
]

{ #category : #testing }
BioNamedObject >> includesName: aString [
	" Answer <true> if receiver contains aString in any of its names "

	^ (self names collect: #asLowercase) includes: aString asLowercase
]

{ #category : #testing }
BioNamedObject >> includesNullName [
	" Answer <true> if receiver includes a null name "
	
	^ self names includes: self nullName
]

{ #category : #accessing }
BioNamedObject >> name [
	" Answer a <String> representing the receiver's preferred name "
	
	 <lint: 'Inconsistent method classification' rationale: 'Object>>name in testing' author: 'HernanMoralesDurand'>

	^ self preferredName
]

{ #category : #accessing }
BioNamedObject >> name: aString [
	" Set aString to be the preferred name of the receiver. Remove any existing null name.
	Answer the receiver "
	
	(self names includes: self nullName) 
		ifTrue: [ self names remove: self nullName ].
	self names addFirst: aString
]

{ #category : #accessing }
BioNamedObject >> nameClass [
	" Answer the class used for storing receiver's names "

	^ OrderedCollection
]

{ #category : #accessing }
BioNamedObject >> names [
	" Answer a <Collection> of receiver's names "

	^ names
		ifNil: [ names := (self preferredName = self nullName
					ifFalse: [ self nameClass with: self preferredName ]
					ifTrue: [ self nameClass with: self nullName ]) ]
]

{ #category : #accessing }
BioNamedObject >> nullName [
	" Answer a <String> representing a default name "
	
	^ 'Unnamed ' , self class name
]

{ #category : #accessing }
BioNamedObject >> numericName [
	" Answer the first receiver's name which is numeric. If not found answer the receiver's null name  "
	
	^ self names 
			detect: [ : aName | aName isNumber or: [ aName isNumeric ] ]
			ifNone: [ self nullName ]
]

{ #category : #accessing }
BioNamedObject >> preferredName [
	" Answer a String with the receiver's preferred name "

	^ names
		ifNil: [ self nullName ]
		ifNotNil: [ :arg | 
			names isString
				ifTrue: [ names ]
				ifFalse: [ names first ] ]
]

{ #category : #accessing }
BioNamedObject >> removeNullName [
	" Answer a <String> representing a default name "
	
	self names remove: self nullName ifAbsent: [ ]
]

{ #category : #accessing }
BioNamedObject >> uniqueName [
	" Answer a <String> intended to represent a unique identifier "
	
	^ self class uniqueName
	
]
