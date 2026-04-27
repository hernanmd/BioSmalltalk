Class {
	#name : 'BioGFF3FeatureListNode',
	#superclass : 'BioGFF3GFF3FileNode',
	#instVars : [
		'lines',
		'_comments'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3FeatureListNode >> _comments [

	^ _comments
]

{ #category : 'generated' }
BioGFF3FeatureListNode >> _comments: anOrderedCollection [

	self setParents: self _comments to: nil.
	_comments := anOrderedCollection.
	self setParents: self _comments to: self
]

{ #category : 'generated' }
BioGFF3FeatureListNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitFeatureList: self
]

{ #category : 'generated' }
BioGFF3FeatureListNode >> compositeNodeVariables [

	^ #( #lines #_comments )
]

{ #category : 'generated-initialize-release' }
BioGFF3FeatureListNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
	_comments := OrderedCollection new: 2.
]

{ #category : 'generated' }
BioGFF3FeatureListNode >> lines [

	^ lines
]

{ #category : 'generated' }
BioGFF3FeatureListNode >> lines: anOrderedCollection [

	self setParents: self lines to: nil.
	lines := anOrderedCollection.
	self setParents: self lines to: self
]
