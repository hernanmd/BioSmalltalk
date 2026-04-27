Class {
	#name : 'BioGFF3DirectiveNode',
	#superclass : 'BioGFF3GFF3FileNode',
	#instVars : [
		'text'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3DirectiveNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitDirective: self
]

{ #category : 'generated' }
BioGFF3DirectiveNode >> text [

	^ text
]

{ #category : 'generated' }
BioGFF3DirectiveNode >> text: aSmaCCToken [

	text := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3DirectiveNode >> tokenVariables [

	^ #( #text )
]
