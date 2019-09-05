Class {
	#name : #PartitionCorrelationSquare,
	#superclass : #CorrelationSquare,
	#instVars : [
		'partitionMatrix',
		'threshold'
	],
	#category : 'Hapax'
}

{ #category : #displaying }
PartitionCorrelationSquare >> atPoint: here [
	"Attention - this implementation of atPoint: adheres to the Shape
	protocol and NOT to the matrix protocol!"
	
	here < self dimension ifFalse: [ ^nil ].
	^Array with: (items at: here x + 1) with: (items at: here y + 1)
]

{ #category : #'document coloring' }
PartitionCorrelationSquare >> colorOf: document [
]

{ #category : #'document coloring' }
PartitionCorrelationSquare >> defaultColors [

	^Topic defaultColors
]

{ #category : #displaying }
PartitionCorrelationSquare >> displayOn: graphicsContext [

	| scheme |
	threshold ifNil: [ ^super asImage displayOn: graphicsContext ].

	scheme := ColorScheme gray.
	partitionMatrix items doWithIndex: [ :clusterA :row |
		partitionMatrix items doWithIndex: [ :clusterB :column |
			| rectangle |
			rectangle := ((clusterA startIndex @ clusterB startIndex) - 1) corner: (clusterA endIndex @ clusterB endIndex).
			graphicsContext paint: (scheme colorValue: (partitionMatrix at: row and: column)).
			graphicsContext displayRectangle: rectangle ]].
]

{ #category : #'user interface' }
PartitionCorrelationSquare >> openDistributionMap [

	| squares parts view |
	squares := OrderedCollection new.
	self topics do: [ :topic |	topic documents do: [ :document |	squares add: document item -> topic ]].
	parts := (squares groupedBy: [ :each | each key belongsTo ]) associations.

	view := Pimon.RectangleFigure new.
	view opaque.
	view addAll: parts do: [ :part |
		"part item is NameSpace -> Collection"
		part addAll: part item value do: [ :square |
			"quare item is Document -> Topic"
			square blend: square item value color ].
		part sort: #value.
		part goldenRatioFlowLayout.
		part item: part item key ].
	view flowLayout: 10 width: 600.	
	view open.

	"view := Mondrian.ViewRenderer new.
	view box: [
		view nodes: parts using: Mondrian.DMRectangle new forEach: [ :each |
			view nodes: each value using: Mondrian.DMSquare new 
		]
	].
	view open"
]

{ #category : #accessing }
PartitionCorrelationSquare >> partitionMatrix [

	^partitionMatrix ifNil: [self reinitializePartitionMatrix]
]

{ #category : #displaying }
PartitionCorrelationSquare >> preferredBounds [

	^0 asPoint extent: self dimension
]

{ #category : #'initialize-release' }
PartitionCorrelationSquare >> reinitializePartitionMatrix [
	| topics clusters color |
	clusters := self dendrogram breakAtThreshold: self threshold negated.
	topics := clusters collect: [:each | Topic in: self withAll: each].

	color := self defaultColors readStream.
	topics do: [ :topic | topic color: color next ].

	^partitionMatrix := CorrelationSquare on: topics
]

{ #category : #accessing }
PartitionCorrelationSquare >> threshold [

	^threshold ifNil: [ 0.5 ]
]

{ #category : #accessing }
PartitionCorrelationSquare >> threshold: aNumber [

	threshold := aNumber.
	aNumber ifNotNil: [ self reinitializePartitionMatrix ].
	^aNumber
]

{ #category : #'document coloring' }
PartitionCorrelationSquare >> topicOf: document [

	^self topics detect: [ :each | each includes: document ]
]

{ #category : #'document coloring' }
PartitionCorrelationSquare >> topics [

	^partitionMatrix items
]

{ #category : #'initialize-release' }
PartitionCorrelationSquare >> useDefaults [

	self performSeriation.
	self threshold: 0.75.
]
