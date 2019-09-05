Class {
	#name : #GraphVizSubgraph,
	#superclass : #GraphVizGraph,
	#instVars : [
		'parent'
	],
	#category : 'GraphViz-Model'
}

{ #category : #adding }
GraphVizSubgraph >> addNewNode: anObject with: associations [

	| node |
	node := self rootGraph nodeNamed: anObject.
	
	^ node 
		ifNil: [super addNewNode: anObject with: associations]
		ifNotNil: [self addNode: node with: associations]
]

{ #category : #testing }
GraphVizSubgraph >> isSubgraph [

	^ true
]

{ #category : #accessing }
GraphVizSubgraph >> nodeType [

	^ #subgraph
]

{ #category : #accessing }
GraphVizSubgraph >> parent [

	^ parent
]

{ #category : #accessing }
GraphVizSubgraph >> parent: aGraphVizGraph [

	parent := aGraphVizGraph
]

{ #category : #accessing }
GraphVizSubgraph >> rootGraph [

	^ parent isSubgraph
		ifTrue: [parent rootGraph]
		ifFalse: [parent]
]

{ #category : #streaming }
GraphVizSubgraph >> writeHeaderOn: stream withIndent: aNumber [

		stream cr.
		self indent: aNumber on: stream.
		self id ifNotNilDo:
			[:name | 
			stream
				nextPutAll: self nodeType;
				nextPut: $ ].
			
		self id ifNotNilDo: [:name | stream nextPutAll: self safeId; nextPut: $ ].
		stream nextPutAll: '{'.

]
