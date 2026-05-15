"
Represents a directive list node in a GFF3 file parse tree. Contains multiple directive nodes.
"
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

{ #category : 'variables' }
BioGFF3DirectiveListNode >> compositeNodeVariables [

	^ #( #directives )
]

{ #category : 'generated' }
BioGFF3DirectiveListNode >> directives [

	^ directives
]

{ #category : 'generated' }
BioGFF3DirectiveListNode >> directives: aCollection [

	directives := aCollection
]

{ #category : 'initialization' }
BioGFF3DirectiveListNode >> initialize [

	super initialize.
	directives := OrderedCollection new: 2
]
