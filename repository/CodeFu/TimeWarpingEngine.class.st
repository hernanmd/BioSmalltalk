Class {
	#name : #TimeWarpingEngine,
	#superclass : #Object,
	#instVars : [
		'vectorA',
		'vectorB',
		'matrix',
		'cost',
		'distanceBlock'
	],
	#category : 'CodeFu'
}

{ #category : #accessing }
TimeWarpingEngine >> distanceBlock [
	^distanceBlock
]

{ #category : #accessing }
TimeWarpingEngine >> distanceBlock: anObject [
	distanceBlock := anObject
]

{ #category : #accessing }
TimeWarpingEngine >> getCost [

	^self getCostMatrix last
]

{ #category : #private }
TimeWarpingEngine >> getCostMatrix [

	matrix := DistanceSquare on: vectorA and: vectorB
					using: self distanceBlock.
	cost := ArrayMatrix new: matrix dimension.
	cost at: 1 and: 1 put: (matrix at: 1 and: 1).
	2 to: cost rowSize do: [ :x | cost at: x and: 1 put: (cost at: x - 1 and: 1) + (matrix at: x and: 1) ].
	2 to: cost columnSize do: [ :y | cost at: 1 and: y put: (cost at: 1 and: y - 1) + (matrix at: 1 and: y) ].
	2 to: cost rowSize do: [ :x | 
		2 to: cost columnSize do: [ :y |
			cost at: x and: y put: (
			(matrix at: x and: y) +
			((cost at: x - 1 and: y - 1) min:
			((cost at: x  and: y - 1) min: 
			(cost at: x - 1 and: y)))) ]].
	^cost.
]

{ #category : #accessing }
TimeWarpingEngine >> vectorA [
	^vectorA
]

{ #category : #accessing }
TimeWarpingEngine >> vectorA: anObject [
	vectorA := anObject
]

{ #category : #accessing }
TimeWarpingEngine >> vectorB [
	^vectorB
]

{ #category : #accessing }
TimeWarpingEngine >> vectorB: anObject [
	vectorB := anObject
]
