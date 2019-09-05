Class {
	#name : #SeriationEngine,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
SeriationEngine class >> applyOn: elements [

	^(self with: elements) defaultAlgorithm
]

{ #category : #'instance creation' }
SeriationEngine class >> with: elements [

	^(self new)
		elements: elements;
		yourself
]

{ #category : #algorithm }
SeriationEngine >> defaultAlgorithm [

	^self orderDendrogramLeaves
]

{ #category : #accessing }
SeriationEngine >> elements [
	^elements
]

{ #category : #accessing }
SeriationEngine >> elements: anObject [
	elements := anObject
]

{ #category : #algorithm }
SeriationEngine >> orderDendrogramLeaves [

	| clusty |
	clusty := ClusterEngine with: elements.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	^clusty dendrogram orderLeafs asArray.
]
