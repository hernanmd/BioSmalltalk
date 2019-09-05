Class {
	#name : #BidirectionalMapTest,
	#superclass : #TestCase,
	#instVars : [
		'map'
	],
	#category : 'Hapax'
}

{ #category : #testing }
BidirectionalMapTest >> setUp [

	map := BidirectionalMap new.
	map add: #a -> 1.
	map add: #b -> 2.
	map add: #c -> 3.
]

{ #category : #testing }
BidirectionalMapTest >> testAdd [

	map add: #d -> 4.

	self assert: map checkInvariant.
	self assert: map size = 4.
]

{ #category : #testing }
BidirectionalMapTest >> testAt [

	self assert: (map at: #b) = 2.
	self assert: (map at: 2) = #b.
]

{ #category : #testing }
BidirectionalMapTest >> testAtKey [

	self assert: (map atKey: #b) = 2.
	self should: (map atKey: 2) = nil.
]

{ #category : #testing }
BidirectionalMapTest >> testAtKeyIfAbsentPut [

	self assert: map size = 3.

	self assert: (map atKey: #z ifAbsentPut: [ 26 ]) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).

	self assert: (map atKey: #z ifAbsentPut: [ 26 ]) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).
]

{ #category : #testing }
BidirectionalMapTest >> testAtPut [

	self assert: map size = 3.

	self assert: (map at: #z put: 26) = 26.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).
]

{ #category : #testing }
BidirectionalMapTest >> testAtPutIllegal [

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.

	self should: [ map at: #z put: 2 ] raise: Error.

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.
]

{ #category : #testing }
BidirectionalMapTest >> testAtPutOverride [

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.
	self assert: (map atValue: 4711) = nil.

	self assert: (map at: #b put: 4711) = 4711.

	self assert: map size = 3.
	self assert: (map atValue: 2) = nil.
	self assert: (map atValue: 4711) = #b.
]

{ #category : #testing }
BidirectionalMapTest >> testAtValue [

	self assert: (map atValue: #b) = nil.
	self should: (map atValue: 2) = #b.
]

{ #category : #testing }
BidirectionalMapTest >> testAtValueIfAbsentPut [

	self assert: map size = 3.

	self assert: (map atValue: 26 ifAbsentPut: [ #z ]) = #z.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).

	self assert: (map atValue: 26 ifAbsentPut: [ #z ]) = #z.

	self assert: map size = 4.
	self assert: (map includes: 26).
	self assert: (map includesKey: #z).
]

{ #category : #testing }
BidirectionalMapTest >> testIncludes [


	self assert: (map includes: 2).
	self assert: (map includes: #b) not.
	self assert: (map includes: 4) not.
]

{ #category : #testing }
BidirectionalMapTest >> testIncludesKey [


	self assert: (map includesKey: #b).
	self assert: (map includesKey: 2) not.
	self assert: (map includesKey: #d) not.
]

{ #category : #testing }
BidirectionalMapTest >> testRemove [

	self should: [ map remove: #b -> 2 ] raise: Error
]

{ #category : #testing }
BidirectionalMapTest >> testRemoveKey [


	self assert: (map includes: 2).
	self assert: (map includesKey: #b).

	self should: [ map removeKey: 2 ] raise: Error.
	map removeKey: #b.

	self assert: (map includes: 2) not.
	self assert: (map includesKey: #b) not.
]

{ #category : #testing }
BidirectionalMapTest >> testRemoveValue [


	self assert: (map includes: 2).
	self assert: (map includesKey: #b).

	self should: [ map removeValue: #b ] raise: Error.
	map removeValue: 2.

	self assert: (map includes: 2) not.
	self assert: (map includesKey: #b) not.
]

{ #category : #testing }
BidirectionalMapTest >> testSize [

	self assert: map size = 3.
]
