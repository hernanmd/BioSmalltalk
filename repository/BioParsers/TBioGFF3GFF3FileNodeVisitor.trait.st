"
Trait providing visitor methods for GFF3 parse tree nodes. Implements double-dispatch visiting for AST traversal of GFF3 files.
"
Trait {
	#name : 'TBioGFF3GFF3FileNodeVisitor',
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitCommentRecord: aCommentRecord [

	^ self visitGFF3File: aCommentRecord
]

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitDirective: aDirective [

	^ self visitGFF3File: aDirective
]

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitDirectiveList: aDirectiveList [

	^ self visitGFF3File: aDirectiveList
]

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitFeatureLine: aFeatureLine [

	^ self visitGFF3File: aFeatureLine
]

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitFeatureList: aFeatureList [

	^ self visitGFF3File: aFeatureList
]

{ #category : 'generated' }
TBioGFF3GFF3FileNodeVisitor >> visitGFF3File: aGFF3File [

	^ self visitSmaCCParseNode: aGFF3File
]
