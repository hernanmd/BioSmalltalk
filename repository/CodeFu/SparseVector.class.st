Class {
	#name : #SparseVector,
	#superclass : #Vector,
	#instVars : [
		'size',
		'contents'
	],
	#category : 'CodeFu'
}

{ #category : #adding }
SparseVector >> addLast [

	size := size + 1.
]

{ #category : #accessing }
SparseVector >> at: anIndex [

	| spot |
	spot := self internalIndexOf: anIndex.
	^spot > 0
		ifTrue: [ (contents at: spot) value ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
SparseVector >> at: anIndex put: aNumber [

	aNumber isZero
		ifTrue: [ self removeValueAt: anIndex ]
		ifFalse: [ self setValue: aNumber at: anIndex ].
	^aNumber
]

{ #category : #enumerating }
SparseVector >> doSparseWithIndex: aBlock [

	contents do: [ :each | 
		aBlock 
			value: each value 
			value: each key ].
]

{ #category : #'initialize-release' }
SparseVector >> initializeSize: aSize [

	size := aSize.
	contents := OrderedCollection new.
]

{ #category : #private }
SparseVector >> internalIndexOf: anIndex [ 
	"Searchs for the internal index of anIndex with O(log n) using binary search, returns
	either the internal index of anIndex or, if anIndex is not found, the negated internal 
	index to be used for insertion."

	| mid low high index0 |
	low := 1.
	high := contents size.
	[mid := high + low // 2.
	low > high]
		whileFalse: 
			[ index0 := contents at: mid.
			index0 key <= anIndex
				ifTrue: [
					index0 key = anIndex 
						ifTrue: [ ^mid ]
						ifFalse: [ low := mid + 1 ]]
				ifFalse: [high := mid - 1]].
	^low negated
]

{ #category : #private }
SparseVector >> removeValueAt: anIndex [

	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0 
		ifTrue: [ contents removeIndex: spot ].
]

{ #category : #private }
SparseVector >> setValue: aNumber at: anIndex [

	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0
		ifTrue: [ (contents at: spot) value: aNumber ]
		ifFalse: [ contents add: anIndex -> aNumber beforeIndex: spot negated ]
]

{ #category : #accessing }
SparseVector >> size [

	^size
]

{ #category : #accessing }
SparseVector >> sparseSize [

	^contents size
]

{ #category : #'mathematical functions' }
SparseVector >> sum [

	^contents inject: 0 into: [ :sum :each | sum + each value ]
]
