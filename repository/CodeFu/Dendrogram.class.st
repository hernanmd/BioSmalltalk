Class {
	#name : #Dendrogram,
	#superclass : #Collection,
	#instVars : [
		'parent'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
Dendrogram class >> with: anElement [

	^DendrogramLeaf with: anElement
]

{ #category : #adding }
Dendrogram >> add: newObject [

	self shouldNotImplement
]

{ #category : #'break into clusters' }
Dendrogram >> breakAtThreshold: aNumber [

	| candidates |
	candidates := (self nodes select: [ :each | each threshold < aNumber ]), self leaves.
	^candidates reject: [ :each | candidates includes: each parent ].
]

{ #category : #'break into clusters' }
Dendrogram >> breakInto: numberOfClusters [

	| all candidates |
	all := self nodes reverseSort: #threshold.
	candidates := IdentitySet with: all first.
	all do: [ :each |
		candidates remove: each.
		candidates add: each left.
		candidates add: each right.
		candidates size >= numberOfClusters ifTrue: [ ^candidates asArray ]].
]

{ #category : #seriation }
Dendrogram >> dist: dendrogram [

	| sum |
	sum := Accumulator sum.
	self elements cross: dendrogram elements do: [ :a :b | sum add: (a dist: b) ].
	^sum average
]

{ #category : #enumerating }
Dendrogram >> do: aBlock [

	self elementsDo: aBlock
]

{ #category : #accessing }
Dendrogram >> elements [

	| stream |
	stream := Array new writeStream.
	self elementsDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #enumerating }
Dendrogram >> elementsDo: aBlock [

	^self subclassResponsibility
]

{ #category : #accessing }
Dendrogram >> index [

	^self isRoot
		ifTrue: [ 1 ]
		ifFalse: [ self isLeft
			ifTrue: [ self parent index ]
			ifFalse: [ self parent index + self parent left size ]]
]

{ #category : #testing }
Dendrogram >> isLeft [

	^self parent left == self
]

{ #category : #testing }
Dendrogram >> isRight [

	^self parent right == self
]

{ #category : #testing }
Dendrogram >> isRoot [

	^parent == nil
]

{ #category : #accessing }
Dendrogram >> leaves [

	| stream |
	stream := Array new writeStream.
	self leavesDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #enumerating }
Dendrogram >> leavesDo: aBlock [

	^self subclassResponsibility
]

{ #category : #accessing }
Dendrogram >> left [

	^self  subclassResponsibility
]

{ #category : #'instance creation' }
Dendrogram >> merge: dendrogram at: threshold [

	^DendrogramNode with: self with: dendrogram at: threshold
]

{ #category : #accessing }
Dendrogram >> nodes [

	| stream |
	stream := Array new writeStream.
	self nodesDo: [ :each | stream nextPut: each ].
	^stream contents
]

{ #category : #enumerating }
Dendrogram >> nodesDo: aBlock [

	^self subclassResponsibility
]

{ #category : #seriation }
Dendrogram >> orderLeafs [

	^self subclassResponsibility
]

{ #category : #accessing }
Dendrogram >> parent [
	
	^parent
]

{ #category : #removing }
Dendrogram >> remove: oldObject ifAbsent: anExceptionBlock [

	self shouldNotImplement
]

{ #category : #accessing }
Dendrogram >> right [

	^self  subclassResponsibility
]

{ #category : #accessing }
Dendrogram >> size [

	^self subclassResponsibility
]

{ #category : #private }
Dendrogram >> species [
	^OrderedCollection
]

{ #category : #seriation }
Dendrogram >> swap [

	^self subclassResponsibility
]

{ #category : #accessing }
Dendrogram >> threshold [

	^self  subclassResponsibility
]
