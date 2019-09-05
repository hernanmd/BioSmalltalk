"
Abstract class to group common behavior of single value nodes in a BLAST tree
"
Class {
	#name : #BioBlastValueNode,
	#superclass : #BioBlastNode,
	#instVars : [
		'value'
	],
	#category : 'BioParsers-Support'
}

{ #category : #accessing }
BioBlastValueNode >> addToRoot: aGTBLASTRootNode [
	" Do nothing "

]

{ #category : #accessing }
BioBlastValueNode >> blastValue [
	" Answer the receiver's value "
	
	^ value isNumeric
		ifTrue: [ value asNumber ]
		ifFalse: [ value isString 
			ifTrue: [ value asLowercase ]
			ifFalse: [ value ] ]		
]

{ #category : #accessing }
BioBlastValueNode >> blastValue: anObject [
	value := anObject
]

{ #category : #accessing }
BioBlastValueNode >> do: aBlock [

	^ aBlock value: self
]

{ #category : #accessing }
BioBlastValueNode >> selectNodesNamed: aNodeName [

	^ OrderedCollection new
]

{ #category : #accessing }
BioBlastValueNode >> values: aNodeName [
	" Answer the receiver's value if aNodeName is the receiver's name "
	
	^ self nodeName = aNodeName
		ifTrue: [ self blastValue ]

]
