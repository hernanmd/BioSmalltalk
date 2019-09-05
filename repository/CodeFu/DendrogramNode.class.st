Class {
	#name : #DendrogramNode,
	#superclass : #Dendrogram,
	#instVars : [
		'left',
		'right',
		'threshold'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
DendrogramNode class >> with: left with: right at: threshold [

	| new |
	new := (self new)
		instVarNamed: 'left' put: left;
		instVarNamed: 'right' put: right;
		instVarNamed: 'threshold' put: threshold;
		yourself.
	left instVarNamed: 'parent' put: new.
	right instVarNamed: 'parent' put: new.
	^new
]

{ #category : #enumerating }
DendrogramNode >> elementsDo: aBlock [

	left elementsDo: aBlock.
	right elementsDo: aBlock.
]

{ #category : #enumerating }
DendrogramNode >> leavesDo: aBlock [

	left leavesDo: aBlock.
	right leavesDo: aBlock.
]

{ #category : #accessing }
DendrogramNode >> left [

	^left
]

{ #category : #enumerating }
DendrogramNode >> nodesDo: aBlock [

	aBlock value: self.
	left nodesDo: aBlock.
	right nodesDo: aBlock.
]

{ #category : #seriation }
DendrogramNode >> orderLeafs [

	| a b c d array |
	a := self left left.
	b := self left right.
	c := self right left.
	d := self right right.
	array := Array 
				with: (a dist: c) -> [self left swap]
				with: (a dist: d) -> 
							[self left swap.
							self right swap]
				with: (b dist: c) -> []
				with: (b dist: d) -> [self right swap].
	(array asSortedCollection: #key asSortBlock) first value value.
	self left orderLeafs.
	self right orderLeafs
]

{ #category : #accessing }
DendrogramNode >> right [

	^right
]

{ #category : #accessing }
DendrogramNode >> size [

	^left size + right size
]

{ #category : #seriation }
DendrogramNode >> swap [

	| swap |
	swap := left.
	left := right.
	right := swap.
]

{ #category : #accessing }
DendrogramNode >> threshold [

	^threshold
]
