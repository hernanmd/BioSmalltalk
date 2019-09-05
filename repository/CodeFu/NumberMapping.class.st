Class {
	#name : #NumberMapping,
	#superclass : #Mapping,
	#instVars : [
		'back',
		'forth'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
NumberMapping class >> new [

	^(super new) 
		initialize;
		yourself
]

{ #category : #'instance creation' }
NumberMapping class >> new: aSize [

	^(super new)
		setSize: aSize;
		yourself
]

{ #category : #adding }
NumberMapping >> add: index [
	"Maps an index to the next free key.
	If the index is already mapped, throws an error.
	@post-condition: 
		anIndex <= self indexSize.
		self keyAt: anIndex = self size.
		self indexAt: self size = anIndex.
	"

	index > self lastIndex 
		ifTrue: [ forth changeSizeTo: index ]
		ifFalse: [ (self includesIndex: index) ifTrue: [ Error raiseRequest ] ].
	back add: index.
	forth at: index put: back size.
	^index
]

{ #category : #accessing }
NumberMapping >> atKey: key ifAbsent: exceptionBlock [
	"Returns index of an ordinal key,
	that is maps backwards from new to old 'indices'."

	^[ back at: key ]
		on: SubscriptOutOfBoundsError
		do: [ :ex | exceptionBlock value ]
]

{ #category : #enumerating }
NumberMapping >> do: aBlock [

	back do: aBlock
]

{ #category : #'initialize-release' }
NumberMapping >> initialize [
	"Sets up instance variables.
	back -- maps from ordinal keys to indices, ie. its values are indices (old indices).
	forth -- maps from indices to ordinal keys, ie. its values are ordinal keys (new indices) and thus may be nil."

	back := OrderedCollection new.
	forth := OrderedCollection new.
]

{ #category : #'accessing - name' }
NumberMapping >> keyForName: name ifAbsent: exceptionBlock [

	^name isInteger ifTrue: [ name ]
		ifFalse: [ exceptionBlock value ]
]

{ #category : #accessing }
NumberMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	"Returns ordinal key of a index.
	that is maps forward from old to new indices."

	^[ (forth at: anIndex) ifNil: [ exceptionBlock value ] ]
		on: SubscriptOutOfBoundsError
		do: [ :ex | exceptionBlock value ]
]

{ #category : #accessing }
NumberMapping >> keys [

	^1 to: self size
]

{ #category : #adding }
NumberMapping >> lastIndex [

	^forth size
]

{ #category : #'accessing - name' }
NumberMapping >> nameForKey: key [

	KeyNotFound raise
]

{ #category : #removing }
NumberMapping >> replaceAll: aCollection [

	self initialize.
	self addAll: aCollection.
]

{ #category : #'initialize-release' }
NumberMapping >> setSize: size [

	back := forth := 1 to: size.
]

{ #category : #accessing }
NumberMapping >> size [

	^back size
]
