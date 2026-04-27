Class {
	#name : 'BioGFF3GFF3FileNode',
	#superclass : 'SmaCCParseNode',
	#instVars : [
		'directives',
		'features'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3GFF3FileNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitGFF3File: self
]

{ #category : 'generated' }
BioGFF3GFF3FileNode >> directives [

	^ directives
]

{ #category : 'generated' }
BioGFF3GFF3FileNode >> directives: aBioGFF3DirectiveListNode [

	self directives notNil ifTrue: [ self directives parent: nil ].
	directives := aBioGFF3DirectiveListNode.
	self directives notNil ifTrue: [ self directives parent: self ]
]

{ #category : 'generated' }
BioGFF3GFF3FileNode >> features [

	^ features
]

{ #category : 'generated' }
BioGFF3GFF3FileNode >> features: aBioGFF3FeatureListNode [

	self features notNil ifTrue: [ self features parent: nil ].
	features := aBioGFF3FeatureListNode.
	self features notNil ifTrue: [ self features parent: self ]
]

{ #category : 'generated' }
BioGFF3GFF3FileNode >> nodeVariables [

	^ #( #directives #features )
]
