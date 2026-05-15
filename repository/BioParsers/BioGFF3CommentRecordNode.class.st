"
Represents a comment line node in a GFF3 file parse tree. Holds the comment text. Instance Variables: text <String> The comment text content.
"
Class {
	#name : 'BioGFF3CommentRecordNode',
	#superclass : 'BioGFF3GFF3FileNode',
	#instVars : [
		'text'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3CommentRecordNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitCommentRecord: self
]

{ #category : 'generated' }
BioGFF3CommentRecordNode >> text [

	^ text
]

{ #category : 'generated' }
BioGFF3CommentRecordNode >> text: aSmaCCToken [

	text := aSmaCCToken
]

{ #category : 'variables' }
BioGFF3CommentRecordNode >> tokenVariables [

	^ #( #text )
]
