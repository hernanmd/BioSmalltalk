Class {
	#name : #SVDAlgorithm,
	#superclass : #Object,
	#instVars : [
		'n',
		'm',
		'U',
		'S',
		'V',
		'A',
		'dim'
	],
	#category : 'Hapax'
}

{ #category : #heuristic }
SVDAlgorithm class >> defaultRank [

	| rank |
	rank := ((self documentSize * self termSize) ** 0.2) ceiling.
	^(((rank max: 3) min: self documentSize) min: self termSize)
]

{ #category : #sorting }
SVDAlgorithm >> at: anIndex [
	"comment stating purpose of message"

	^Array with: (U columnAt: anIndex) asArray with: (S at: anIndex) with: (V columnAt: anIndex) asArray.
]

{ #category : #sorting }
SVDAlgorithm >> at: anIndex put: singularTriplet [
	"comment stating purpose of message"

	U columnAt: anIndex put: (singularTriplet at: 1).
	S at: anIndex put: (singularTriplet at: 2).
	V columnAt: anIndex put: (singularTriplet at: 3).
]

{ #category : #private }
SVDAlgorithm >> decompose [

	U := RowMatrix withAll: A.
	m := A rowSize.
	n := A columnSize.
	V := RowMatrix new: n@n.
	S := ArrayVector new: n.

	self performDecomposition	.
	self sort.

	A := nil.
]

{ #category : #accessing }
SVDAlgorithm >> getS [

	self isDecomposed not ifTrue: [ self decompose ].
	^S
]

{ #category : #accessing }
SVDAlgorithm >> getU [

	self isDecomposed not ifTrue: [ self decompose ].
	^U
]

{ #category : #accessing }
SVDAlgorithm >> getV [

	self isDecomposed not ifTrue: [ self decompose ].
	^V
]

{ #category : #testing }
SVDAlgorithm >> isDecomposed [

	^(S ~= nil) & (U ~= nil) & (V ~= nil) & (A = nil)
]

{ #category : #accessing }
SVDAlgorithm >> setDimensions: numDimensions [

	dim := numDimensions
]

{ #category : #accessing }
SVDAlgorithm >> setMatrix: aMatrix [

	"aMatrix emptyCheck."
	A := aMatrix.
	S := U := V := nil.
]

{ #category : #sorting }
SVDAlgorithm >> size [

	^S size
]

{ #category : #sorting }
SVDAlgorithm >> sort [

	(SequenceableCollectionSorter 
		on: self 
		using: [ :a :b | (a at: 2) >= (b at: 2) ]) 
		sort.
]
