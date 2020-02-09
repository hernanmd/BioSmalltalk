"
BioBLASTNode is the abstract class grouping all behavior related to constructing a tree from XML BLAST parsing. Refer to the BioBlastXMLParserTest to find how subclasses are used.

Instead of representing each node as a class, this hierarchy abstracts classes for node 'types' found in the XML DTD. This class only provides naming for nodes built by subclasses.

Instance Variables:
	nodeName	<String>
"
Class {
	#name : #BioBlastNode,
	#superclass : #BioObject,
	#instVars : [
		'nodeName'
	],
	#category : #'BioParsers-Support'
}

{ #category : #accessing }
BioBlastNode class >> allContentSubclasses [

	^ self allSubclasses difference: ( Array with: BioBlastStructureNode )
]

{ #category : #accessing }
BioBlastNode class >> allNodeNames [
	" Answer a Collection with all the BLAST XML node names "

	^ ( self allContentSubclasses collect: [ : cls | cls nodeNames ] ) joinUsing: Array new

]

{ #category : #accessing }
BioBlastNode class >> allNodeWithDescriptions [
	" Answer a Collection with all the BLAST XML node names with descriptions "

	| answer |
	
	answer := Dictionary new.
	( self allContentSubclasses collect: [ : cls  | cls nodesWithDescriptions ] ) 
		do: [: each | answer addAll: each ].
	^ answer


]

{ #category : #accessing }
BioBlastNode class >> findElementNodeFor: aString [
	" Answer an element node instance matching aString "

	^ self allContentSubclasses 
		detect: [ : cls | cls nodeNames includes: aString ] 
		ifFound: [ : found | found new nodeName: aString  ]
		ifNone: [ nil ]
]

{ #category : #accessing }
BioBlastNode class >> nodeFor: aString [
	" Answer a new instance of a subclass corresponding to element named aString "
	
	^ (#('Hsp' 'Hit_hsps' 'Hit') includes: aString)
		ifTrue: [ BioBlastParentNode new nodeName: aString ]
		ifFalse: [ self findElementNodeFor: aString ]
]

{ #category : #accessing }
BioBlastNode class >> nodeNames [

	^ Array empty
]

{ #category : #accessing }
BioBlastNode class >> nodesWithDescriptions [
	" Answer a <Collection> of receiver nodes with corresponding description "
	
	| answer |
	
	answer := Dictionary new.
	self nodeNames 
		with: self nodeDescriptions 
		do: [ : nodeName : description | answer add: ( nodeName -> description ) ].
	^ answer
]

{ #category : #comparing }
BioBlastNode >> = aBioBlastNode [

	^ self nodeName = aBioBlastNode nodeName 

]

{ #category : #accessing }
BioBlastNode >> addToRoot: aRootNode [
	" Private - Add the receiver to aRootNode "

	(aRootNode isEmpty or: [ self isRootIn: aRootNode ])
		ifTrue: [ aRootNode addRootNode: self ]
		ifFalse: [ aRootNode addNode: self ]
]

{ #category : #'accessing nodes' }
BioBlastNode >> do: aBlock [
	" Answer a Collection of receiver's nodes named aNodeName "
	
	self nodes do: [ : node | aBlock value: node  ].

]

{ #category : #testing }
BioBlastNode >> hasNodeNamed: aNodeName [
	^ self nodes anySatisfy: [ :node | node nodeName = aNodeName ]
]

{ #category : #comparing }
BioBlastNode >> hash [

	^ self nodeName hash
]

{ #category : #testing }
BioBlastNode >> isParentNode [

	^ false
]

{ #category : #accessing }
BioBlastNode >> isRootIn: aRootNode [
	" Answer <true> if receiver's is used as 'top' element in
	the aRootNode nodes. I.e. if the receiver is a 'hit' node and the
	first node in aRootNode's nodes is a 'hit' then add it "
	
	^ (aRootNode first nodeName = self nodeName) or: [ self isStructureNode ]

]

{ #category : #testing }
BioBlastNode >> isStructureNode [ 

	^ false
]

{ #category : #accessing }
BioBlastNode >> nodeName [
	^ nodeName
]

{ #category : #accessing }
BioBlastNode >> nodeName: anObject [
	nodeName := anObject
]

{ #category : #testing }
BioBlastNode >> notEmpty [
	"Answer whether the receiver contains any elements."

	^ self nodes notEmpty.
]

{ #category : #printing }
BioBlastNode >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self nodeName asString between: $[ and: $]
]

{ #category : #'accessing nodes' }
BioBlastNode >> selectNodeNamed: aNodeName [
	" Answer the node named aNodeName "
	
	^ self nodes 
			detect: [ : node | node nodeName = aNodeName ]
			ifNone: [ nil ]

]

{ #category : #'accessing nodes' }
BioBlastNode >> selectNodesNamed: aNodeName [
	" Answer a Collection of receiver's nodes named aNodeName "

	| answer |
	answer := OrderedCollection new.
	(self hasNodeNamed: aNodeName)
		ifFalse: [ self nodes do: [ :node | answer addAll: (node selectNodesNamed: aNodeName) ] ]
		ifTrue: [ answer addAll: (self nodes select: [ :node | node nodeName = aNodeName ]) ].
	^ answer
]
