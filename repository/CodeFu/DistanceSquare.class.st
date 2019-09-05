Class {
	#name : #DistanceSquare,
	#superclass : #SymetricMatrix,
	#instVars : [
		'distanceBlock',
		'columnVector',
		'items',
		'dendrogram'
	],
	#category : 'CodeFu'
}

{ #category : #constants }
DistanceSquare class >> defaultDistanceBlock [

	^[ :a :b | a dist: b ]
]

{ #category : #'instance creation' }
DistanceSquare class >> on: items [

	^self on: items using: self defaultDistanceBlock
]

{ #category : #'instance creation' }
DistanceSquare class >> on: vectorA and: vectorB using: distanceBlock [

	[ vectorA size = vectorB size ] assert.
	^(self new: vectorA size)
		initialize: vectorA and: vectorB using: distanceBlock;
		yourself
]

{ #category : #'instance creation' }
DistanceSquare class >> on: items using: distanceBlock [

	^(self new: items size)
		initialize: items using: distanceBlock;
		yourself
]

{ #category : #private }
DistanceSquare class >> vectorSpecies [

	^ArrayVector "FloatVector"
]

{ #category : #accessing }
DistanceSquare >> at: row and: column put: aNumber [

	^self noModificationError
]

{ #category : #private }
DistanceSquare >> checkInvariant [

	^super checkInvariant and: [
		(distanceBlock respondsTo: #value:value:) and: [
			items isCollection ]]
]

{ #category : #private }
DistanceSquare >> copyClusteringData [

	^partialColumns collect: [ :each | each copy ]
]

{ #category : #accessing }
DistanceSquare >> dendrogram [

	dendrogram == nil ifTrue: [ self performSeriation ].
	^dendrogram
]

{ #category : #accessing }
DistanceSquare >> distanceBlock [
	^distanceBlock
]

{ #category : #accessing }
DistanceSquare >> distanceBlock: anObject [

	distanceBlock := anObject
]

{ #category : #'initialize-release' }
DistanceSquare >> initialize: vectorA and: vectorB using: aDistanceBlock [

	items := nil.
	distanceBlock := aDistanceBlock.
	partialColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			distanceBlock value: (vectorA at: column) value: (vectorB at: row) ]]
]

{ #category : #'initialize-release' }
DistanceSquare >> initialize: someItems using: aDistanceBlock [

	items := someItems.
	distanceBlock := aDistanceBlock.
	partialColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			distanceBlock value: (items at: column) value: (items at: row) ]]
]

{ #category : #accessing }
DistanceSquare >> items [

	^items
]

{ #category : #actions }
DistanceSquare >> performSeriation [

	| clusty newOrder |
	clusty := ClusterEngine withDistanceMatrix: self.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	dendrogram := clusty dendrogram.
	newOrder := self dendrogram orderLeafs asArray.
	self rearrange: newOrder.
]

{ #category : #private }
DistanceSquare >> rearrange: newItems [

	| newColumns indices |
	[ items equalsTo: newItems ] assert.
	"create new column vectors."
	newColumns := partialColumns collect: [ :each | each copyEmpty: each size ].
	"get the new order of indices."
	indices := newItems collect: [ :each | items indexOf: each ].
	"map the distances into to the new vectors."
	newColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			self at: (indices at: column) and: (indices at: row) ]].
	"update state of object and check invariant"
	partialColumns := newColumns.
	items := newItems.
	"items := newItems."
	[ self checkInvariant ] assert.
]
