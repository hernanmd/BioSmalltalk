Class {
	#name : 'BioGFF3FeatureLineNode',
	#superclass : 'BioGFF3GFF3FileNode',
	#instVars : [
		'seqid',
		'_source',
		'type',
		'start',
		'end',
		'score',
		'strand',
		'phase',
		'_attributes'
	],
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'generated' }
BioGFF3FeatureLineNode >> _attributes [

	^ _attributes
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> _attributes: aSmaCCToken [

	_attributes := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> _source [

	^ _source
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> _source: aSmaCCToken [

	_source := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> acceptVisitor: aGFF3FileVisitor [

	^ aGFF3FileVisitor visitFeatureLine: self
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> end [

	^ end
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> end: aSmaCCToken [

	end := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> phase [

	^ phase
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> phase: aSmaCCToken [

	phase := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> score [

	^ score
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> score: aSmaCCToken [

	score := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> seqid [

	^ seqid
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> seqid: aSmaCCToken [

	seqid := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> start [

	^ start
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> start: aSmaCCToken [

	start := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> strand [

	^ strand
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> strand: aSmaCCToken [

	strand := aSmaCCToken
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> tokenVariables [

	^ #( #seqid #_source #type #start #end #score #strand #phase #_attributes )
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> type [

	^ type
]

{ #category : 'generated' }
BioGFF3FeatureLineNode >> type: aSmaCCToken [

	type := aSmaCCToken
]
