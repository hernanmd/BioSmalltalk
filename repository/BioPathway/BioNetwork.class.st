"
I represent a directed multigraph view of a biological pathway. Nodes are species, edges are interactions or reaction flows. I support adjacency queries, degree computation, path finding and component analysis.
"
Class {
	#name : 'BioNetwork',
	#superclass : 'Object',
	#instVars : [
		'nodes',
		'edges'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'adding' }
BioNetwork >> addEdge: anInteraction [
	self edges add: anInteraction.
	self addNode: anInteraction source.
	self addNode: anInteraction target
]

{ #category : 'adding' }
BioNetwork >> addNode: aSpecies [
	^ self nodes add: aSpecies
]

{ #category : 'accessing' }
BioNetwork >> adjacencyList [
	| adj |
	adj := Dictionary new.
	self nodes do: [ :n | adj at: n put: OrderedCollection new ].
	self edges do: [ :e | (adj at: e source ifAbsentPut: [ OrderedCollection new ]) add: e target ].
	^ adj
]

{ #category : 'accessing' }
BioNetwork >> edgeCount [
	^ self edges size
]

{ #category : 'accessing' }
BioNetwork >> edges [
	^ edges ifNil: [ edges := OrderedCollection new ]
]

{ #category : 'accessing' }
BioNetwork >> edges: aCollection [
	edges := aCollection
]

{ #category : 'testing' }
BioNetwork >> hasEdgeFrom: aSource to: aTarget [
	^ self edges anySatisfy: [ :e | e source = aSource and: [ e target = aTarget ] ]
]

{ #category : 'testing' }
BioNetwork >> hasNode: aNode [
	^ self nodes includes: aNode
]

{ #category : 'accessing' }
BioNetwork >> inDegreeOf: aNode [
	^ self edges count: [ :e | e target = aNode ]
]

{ #category : 'accessing' }
BioNetwork >> neighborsOf: aNode [
	^ self edges select: [ :e | e source = aNode ] thenCollect: [ :e | e target ]
]

{ #category : 'accessing' }
BioNetwork >> nodes [
	^ nodes ifNil: [ nodes := Set new ]
]

{ #category : 'accessing' }
BioNetwork >> nodes: aCollection [
	nodes := aCollection
]

{ #category : 'accessing' }
BioNetwork >> outDegreeOf: aNode [
	^ self edges count: [ :e | e source = aNode ]
]

{ #category : 'accessing' }
BioNetwork >> predecessorsOf: aNode [
	^ self edges select: [ :e | e target = aNode ] thenCollect: [ :e | e source ]
]

{ #category : 'removing' }
BioNetwork >> removeEdge: anEdge [
	self edges remove: anEdge ifAbsent: []
]

{ #category : 'removing' }
BioNetwork >> removeNode: aNode [
	self nodes remove: aNode ifAbsent: [].
	self edges: (self edges reject: [ :e | e source = aNode or: [ e target = aNode ] ])
]

{ #category : 'accessing' }
BioNetwork >> size [
	^ self nodes size
]
