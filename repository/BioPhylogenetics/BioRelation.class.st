"
A BioRelation is basically an Association with an ""edge"", any object acting as a relation between two nodes.

This class is based in the work of Bio::Relation in the BioRuby library.

"
Class {
	#name : #BioRelation,
	#superclass : #BioNamedObject,
	#instVars : [
		'node',
		'edge'
	],
	#category : 'BioPhylogenetics-Core'
}

{ #category : #comparing }
BioRelation >> = aBioRelation [
	"Answer whether the receiver and anObject represent the same object."

	self class = aBioRelation class
		ifFalse: [ ^ false ].
	self edge = aBioRelation edge 
		ifFalse: [ ^ false ].
	self node = aBioRelation node
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
BioRelation >> >= aBioRelation [
	"Answer whether the receiver's edge is greater of aBioRelation. "

	^ self edge >= aBioRelation edge

]

{ #category : #accessing }
BioRelation >> edge [
	^ edge
]

{ #category : #accessing }
BioRelation >> edge: anObject [
	edge := anObject
]

{ #category : #accessing }
BioRelation >> from [
	" Answer the first relation <Object> "

	^ self node first
]

{ #category : #comparing }
BioRelation >> hash [
	" Hash is reimplemented because #= is reimplemented "

	^ self edge hash bitXor: self node hash
]

{ #category : #initialize }
BioRelation >> initializeEdge: anEdge with: firstNode with: secondNode [
	" Private - Initialize the receiver's binary relation "

	self node: (Array with: firstNode with: secondNode).
	self edge: anEdge
]

{ #category : #accessing }
BioRelation >> node [
	^ node
]

{ #category : #accessing }
BioRelation >> node: anObject [
	node := anObject
]

{ #category : #accessing }
BioRelation >> relation [

	^ edge
]
