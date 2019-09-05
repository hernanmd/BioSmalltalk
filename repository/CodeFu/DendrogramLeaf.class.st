Class {
	#name : #DendrogramLeaf,
	#superclass : #Dendrogram,
	#instVars : [
		'element'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
DendrogramLeaf class >> with: anElement [

	^(self new)
		instVarNamed: 'element' put: anElement;
		yourself
]

{ #category : #accessing }
DendrogramLeaf >> element [
	^element
]

{ #category : #enumerating }
DendrogramLeaf >> elementsDo: aBlock [

	aBlock value: element
]

{ #category : #enumerating }
DendrogramLeaf >> leavesDo: aBlock [

	aBlock value: self
]

{ #category : #accessing }
DendrogramLeaf >> left [

	^self
]

{ #category : #enumerating }
DendrogramLeaf >> nodesDo: aBlock [

	"does nothing"
]

{ #category : #seriation }
DendrogramLeaf >> orderLeafs [

	"do nothing"
]

{ #category : #accessing }
DendrogramLeaf >> right [

	^self
]

{ #category : #accessing }
DendrogramLeaf >> size [

	^1
]

{ #category : #seriation }
DendrogramLeaf >> swap [

	"does nothing"
]

{ #category : #accessing }
DendrogramLeaf >> threshold [

	^Number zero
]
