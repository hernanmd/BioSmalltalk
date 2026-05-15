"
Represents the root node of a BLAST XML result tree. Acts as the top-level container for all BLAST result elements.
"
Class {
	#name : 'BioBlastRootNode',
	#superclass : 'BioBlastParentNode',
	#category : 'BioParsers-BLAST',
	#package : 'BioParsers',
	#tag : 'BLAST'
}

{ #category : 'accessing' }
BioBlastRootNode >> addNode: aNode [

	aNode addToParent: self last
]

{ #category : 'accessing' }
BioBlastRootNode >> addRootNode: aNode [
	" Add aNode to the receiver's nodes "

	self nodes add: aNode
]

{ #category : 'accessing' }
BioBlastRootNode >> hits [
	" Answer the <Collection> of hits in the receiver's nodes "
	
	^ self nodes select: #isHitNode
]
