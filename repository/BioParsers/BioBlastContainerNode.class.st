Class {
	#name : #BioBlastContainerNode,
	#superclass : #BioBlastNode,
	#instVars : [
		'nodes'
	],
	#category : 'BioParsers-Support'
}

{ #category : #comparing }
BioBlastContainerNode >> = aBioBlastNode [
	" Answer whether the receiver and anObject represent the same object. "

	^ super = aBioBlastNode and: [ self nodes = aBioBlastNode nodes ]

]

{ #category : #enumerating }
BioBlastContainerNode >> collect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."
	
	^ self nodes collect: aBlock
]

{ #category : #accessing }
BioBlastContainerNode >> contents [

	^ self nodes
]

{ #category : #accessing }
BioBlastContainerNode >> first [
	"Answer the first element of the receiver"
	
	^ self nodes first
]

{ #category : #comparing }
BioBlastContainerNode >> hash [
	"hash is implemented because #= is implemented"

	^ super hash bitXor: self nodes hash
]

{ #category : #testing }
BioBlastContainerNode >> isEmpty [
	"Answer whether the receiver contains any elements."
	
	^ self nodes isEmpty
]

{ #category : #accessing }
BioBlastContainerNode >> last [
	"Answer the last element of the receiver"
	
	^ self nodes last
]

{ #category : #accessing }
BioBlastContainerNode >> nodes [

	^ nodes
		ifNil: [ nodes := OrderedCollection new ]
]

{ #category : #accessing }
BioBlastContainerNode >> nodes: anObject [
	nodes := anObject
]

{ #category : #printing }
BioBlastContainerNode >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self nodes
		ifNotNil: [ aStream nextPutAll: self nodes size asString between: $( and: $) ].
]

{ #category : #accessing }
BioBlastContainerNode >> size [
	"Answer how many elements the receiver contains."
	
	^ self nodes size
]

{ #category : #accessing }
BioBlastContainerNode >> values: aNodeName [
	" Answer a Collection of receiver's align lengths nodes in each HSP node "
	
	| answer |
	
	answer := self nodes select: [ : node | node nodeName = aNodeName ].
	answer isEmpty
		ifTrue: [ answer := self nodes do: [: node | node values: aNodeName ] ].
	^ answer collect: #value.	
]
