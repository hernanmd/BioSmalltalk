Class {
	#name : #BidirectionalMap,
	#superclass : #Collection,
	#instVars : [
		'backwards',
		'forwards'
	],
	#category : 'Hapax'
}

{ #category : #'instance creation' }
BidirectionalMap class >> equalityNew: capacity [

	^self basicNew initialize: capacity type: Dictionary
]

{ #category : #'instance creation' }
BidirectionalMap class >> identityNew [

	^self identityNew: 5
]

{ #category : #'instance creation' }
BidirectionalMap class >> identityNew: capacity [

	^self basicNew initialize: capacity type: IdentityDictionary
]

{ #category : #'instance creation' }
BidirectionalMap class >> new [

	^self new: 5
]

{ #category : #'instance creation' }
BidirectionalMap class >> new: size [

	^self equalityNew: size
]

{ #category : #'signal constants' }
BidirectionalMap class >> valueAlreadyMappedSignal [

	^ValueAlreadyMappedSignal
]

{ #category : #'instance creation' }
BidirectionalMap class >> withIndicesAndElements: aCollection [

	| map |
	map := self new: aCollection size * 3 // 2.
	aCollection doWithIndex: [ :each :index |
		map at: index put: each ].
	^map
]

{ #category : #adding }
BidirectionalMap >> add: anAssociation [

	self at: anAssociation key put: anAssociation value
]

{ #category : #accessing }
BidirectionalMap >> associations [

	^forwards associations asArray
]

{ #category : #accessing }
BidirectionalMap >> at: anObject [ 

	^self at: anObject ifAbsent: nil
]

{ #category : #accessing }
BidirectionalMap >> at: anObject ifAbsent: exceptionBlock [

	^forwards at: anObject ifAbsent: [ backwards at: anObject ifAbsent: exceptionBlock ]
]

{ #category : #accessing }
BidirectionalMap >> at: key put: value [

	(backwards includesKey: value) ifTrue: [ Error new signal].
	(forwards includesKey: key) ifTrue: [ backwards removeKey: (forwards at: key) ].

	forwards at: key put: value.
	backwards at: value put: key.
	"[ self checkInvariant ] assert."

	^value
]

{ #category : #accessing }
BidirectionalMap >> atKey: key [ 

	^self atKey: key ifAbsent: nil
]

{ #category : #accessing }
BidirectionalMap >> atKey: key ifAbsent: exceptionBlock [

	^forwards at: key ifAbsent: exceptionBlock
]

{ #category : #accessing }
BidirectionalMap >> atKey: key ifAbsentPut: valueBlock [

	| value |
	value := self atKey: key.
	value == nil ifTrue: [ value := self at: key put: valueBlock value	].
	^value
]

{ #category : #accessing }
BidirectionalMap >> atValue: value [

	^self atValue: value ifAbsent: nil
]

{ #category : #accessing }
BidirectionalMap >> atValue: value ifAbsent: exceptionBlock [

	^backwards at: value ifAbsent: exceptionBlock
]

{ #category : #accessing }
BidirectionalMap >> atValue: value ifAbsentPut: keyBlock [

	| key |
	key := self atValue: value.
	key == nil ifTrue: [ self at: (key := keyBlock value) put: value ].
	^key
]

{ #category : #private }
BidirectionalMap >> checkInvariant [

	^forwards size = backwards size and: [
		(forwards keys \ backwards values) isEmpty and: [ 
			(forwards values \ backwards keys) isEmpty ]]
]

{ #category : #enumerating }
BidirectionalMap >> do: aBlock [

	forwards do: aBlock.
]

{ #category : #testing }
BidirectionalMap >> includes: value [

	^forwards includes: value
]

{ #category : #testing }
BidirectionalMap >> includesKey: key [

	^backwards includes: key
]

{ #category : #'initialize-release' }
BidirectionalMap >> initialize: capacity type: typeClass [

	forwards := typeClass new: capacity.
	backwards := typeClass new: capacity.
	[ self checkInvariant ] assert.
]

{ #category : #copying }
BidirectionalMap >> postCopy [
	"Make sure to copy the contents fully."

	super postCopy.
	forwards := forwards copy.
	backwards := backwards copy.
]

{ #category : #removing }
BidirectionalMap >> remove: anObject ifAbsent: exceptionBlock [ 

	self shouldNotImplement
]

{ #category : #removing }
BidirectionalMap >> removeKey: key [ 

	^self removeKey: key ifAbsent: [ Error new raiseSignal ]
]

{ #category : #removing }
BidirectionalMap >> removeKey: key ifAbsent: exceptionBlock [

	| value |
	value := forwards removeKey: key ifAbsent: exceptionBlock.
	backwards removeKey: value.
	[ self checkInvariant ] assert.
	^value
]

{ #category : #removing }
BidirectionalMap >> removeValue: value [ 

	^self removeValue: value ifAbsent: [ Error new signal ]
]

{ #category : #removing }
BidirectionalMap >> removeValue: value ifAbsent: exceptionBlock [

	| key |
	key := backwards removeKey: value ifAbsent: exceptionBlock.
	forwards removeKey: key.
	[ self checkInvariant ] assert.
	^key
]

{ #category : #accessing }
BidirectionalMap >> size [

	^forwards size
]
