Class {
	#name : 'BioGFF3DirectiveListNode',
	#superclass : 'BioGFF3GFF3FileNode',
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3DirectiveListNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitDirectiveList: self
]

{ #category : 'generated' }
BioGFF3DirectiveListNode >> compositeNodeVariables [

	^ #( #directives )
]

{ #category : 'generated' }
BioGFF3DirectiveListNode >> directives [

	^ directives
]

{ #category : 'generated-initialize-release' }
BioGFF3DirectiveListNode >> initialize [
	super initialize.
	directives := OrderedCollection new: 2.
]
