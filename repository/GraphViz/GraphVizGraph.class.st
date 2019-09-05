Class {
	#name : #GraphVizGraph,
	#superclass : #GraphVizItem,
	#instVars : [
		'directed',
		'children',
		'currentGraphReceiver',
		'nodes',
		'layoutSize',
		'edges',
		'currentNodeStyle',
		'currentEdgeStyle'
	],
	#category : 'GraphViz-Model'
}

{ #category : #graphing }
GraphVizGraph >> add: anObject [

	^ self add: anObject with: #()
]

{ #category : #graphing }
GraphVizGraph >> add: anObject with: associations [

	| newEdges newObject |
	
	newObject := anObject isVariableBinding
		ifTrue: 
			[newEdges := self flattenNestedAssocations: anObject.
			newEdges collect: [:each | currentGraphReceiver addNewEdge: each with: associations]]
		ifFalse: 
			[(GraphVizStyle styleNodes includes: anObject)
				ifTrue: [currentGraphReceiver addNewStyle: anObject with: associations]
				ifFalse: 
					[(anObject isCollection and: [anObject isString not])
						ifTrue: [anObject collect: [:each | currentGraphReceiver addNewNode: each with: associations]]
						ifFalse: [currentGraphReceiver addNewNode: anObject with: associations]]].
				
		^ (newObject isCollection and: [newObject size = 1])
			ifTrue: [newObject first]
			ifFalse: [newObject]

]

{ #category : #adding }
GraphVizGraph >> addAttribute: association [

	^ self addNewChild: (GraphVizAttribute new id: association)
]

{ #category : #private }
GraphVizGraph >> addNewChild: aGraphVizItem [

	^ children add: aGraphVizItem
]

{ #category : #adding }
GraphVizGraph >> addNewEdge: anAssocation [

	^ self addNewEdge: anAssocation with: #()
]

{ #category : #adding }
GraphVizGraph >> addNewEdge: anAssociation with: associations [

	| edge atts |
	atts := associations asOrderedCollection.
	
	edge := GraphVizEdge new id: anAssociation.
	atts do: [:each | edge attributeAt: each key put: each value].

	"ensure edge nodes are already in node list"
	edge fromNode: (self addNewNode: anAssociation key).
	edge toNode: (self addNewNode: anAssociation value).
	
	edges at: anAssociation key asString -> anAssociation value asString put: edge.
	edge inheritedStyle: currentEdgeStyle.
	
	^ self addNewChild: edge
]

{ #category : #adding }
GraphVizGraph >> addNewNode: anObject [

	^ self addNewNode: anObject with: #()
]

{ #category : #adding }
GraphVizGraph >> addNewNode: anObject with: associations [

	| node |
	node := self nodeNamed: anObject.
	node ifNotNil: [^ node].
	
	node := GraphVizNode new id: anObject; graph: self.
	
	node inheritedStyle: currentNodeStyle.
	^ self addNode: node with: associations
]

{ #category : #adding }
GraphVizGraph >> addNewStyle: anObject with: associations [

	| atts style |
	(GraphVizStyle styleNodes includes: anObject) ifFalse: [^ self].
	
	atts := associations asOrderedCollection.
	
	style := GraphVizStyle new id: anObject.
	
	anObject = #node ifTrue:
		[currentNodeStyle attributes keysAndValuesDo: [:key :value | style attributeAt: key put: value].
		currentNodeStyle := style].
	
	anObject = #edge ifTrue:
		[currentEdgeStyle attributes keysAndValuesDo: [:key :value | style attributeAt: key put: value].
		currentEdgeStyle := style].
	
	atts do: [:each | style attributes at: each key put: each value].	
	
	^ self addNewChild: style
]

{ #category : #adding }
GraphVizGraph >> addNewSubgraph: anObject [

	| subgraph |
	subgraph := GraphVizSubgraph new
		id: anObject;
		parent: self;
		directed: directed;
		currentNodeStyle: currentNodeStyle;
		currentEdgeStyle: currentEdgeStyle;
		yourself.
		
	^ self addNewChild: subgraph
]

{ #category : #private }
GraphVizGraph >> addNode: aGraphVizNode with: associations [

	| atts |
	atts := associations asOrderedCollection.
	
	atts do: [:each | aGraphVizNode attributeAt: each key put: each value].
	
	nodes at: aGraphVizNode id asString put: aGraphVizNode.
	^ self addNewChild: aGraphVizNode
]

{ #category : #enumerating }
GraphVizGraph >> allEdgesDo: aBlock [

	self edges do: aBlock.
	self subgraphs do: [:each | each allEdgesDo: aBlock]
]

{ #category : #enumerating }
GraphVizGraph >> allNodesDo: aBlock [

	self allNodesDo: aBlock skippingOver: OrderedCollection new
]

{ #category : #private }
GraphVizGraph >> allNodesDo: aBlock skippingOver: nodeList [

	| effectiveNodes |
	effectiveNodes := nodes reject: [:each | nodeList includes: each].	
	effectiveNodes valuesDo: aBlock.
	
	nodeList addAll: effectiveNodes.
	self subgraphs do: [:each | each allNodesDo: aBlock skippingOver: nodeList]
]

{ #category : #graphing }
GraphVizGraph >> at: attribute put: value [
	
	currentGraphReceiver addAttribute: attribute -> value
]

{ #category : #accessing }
GraphVizGraph >> attributes [

	^ children select: [:each | each isAttribute]
]

{ #category : #accessing }
GraphVizGraph >> beDirected [

	directed := true
]

{ #category : #accessing }
GraphVizGraph >> beUndirected [

	directed := false
]

{ #category : #accessing }
GraphVizGraph >> currentEdgeStyle: aGraphVizStyle [

	currentEdgeStyle := aGraphVizStyle
]

{ #category : #accessing }
GraphVizGraph >> currentNodeStyle: aGraphVizStyle [

	currentNodeStyle := aGraphVizStyle
]

{ #category : #accessing }
GraphVizGraph >> directed: aBoolean [

	directed := aBoolean
]

{ #category : #testing }
GraphVizGraph >> doesNotUnderstand: aMessage [

	| argCount |
	argCount := aMessage arguments size.
	argCount = 1 ifTrue: [^ self at: aMessage selector allButLast put: aMessage argument].
	
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
GraphVizGraph >> edgeNamed: anAssociation [

	| edge |
	edge := edges at: anAssociation ifAbsent: [nil].
	
	edge ifNil:
		[self subgraphs do:
			[:each |
			edge := each edgeNamed: anAssociation.
			edge ifNotNil: [^ edge]]].
	
	^ edge
]

{ #category : #accessing }
GraphVizGraph >> edges [

	^ children select: [:each | each isEdge]
]

{ #category : #private }
GraphVizGraph >> flattenNestedAssocations: association [

	 | flattened currentNode associations |

	flattened := OrderedCollection new.
	currentNode := association.

	[currentNode isVariableBinding] whileTrue: 
		[flattened add: currentNode value.
		currentNode := currentNode key].

	flattened add: currentNode.
	flattened := flattened reversed.

	associations := OrderedCollection new.
	1 to: flattened size - 1 do: [:i | associations add: (flattened at: i) -> (flattened at: i + 1)].

	^ associations
]

{ #category : #initialization }
GraphVizGraph >> initialize [

	super initialize.
	children := OrderedCollection new.
	nodes := Dictionary new.
	edges := Dictionary new.
	directed := false.
	currentGraphReceiver := self.
	currentNodeStyle := GraphVizStyle new.
	currentEdgeStyle := GraphVizStyle new.
]

{ #category : #testing }
GraphVizGraph >> isDirected [

	^ directed
]

{ #category : #testing }
GraphVizGraph >> isGraph [

	^ true
]

{ #category : #testing }
GraphVizGraph >> isUndirected [

	^ self isDirected not
]

{ #category : #accessing }
GraphVizGraph >> nodeNamed: anObject [

	| node nodeId |
	nodeId := anObject asString.
	node := nodes at: nodeId ifAbsent: [nil].
	
	node ifNil:
		[self subgraphs do:
			[:each |
			node := each nodeNamed: nodeId.
			node ifNotNil: [^ node]]].
	
	^ node
]

{ #category : #accessing }
GraphVizGraph >> nodeType [

	^ #graph
]

{ #category : #accessing }
GraphVizGraph >> nodes [

	^ children select: [:each | each isNode]
]

{ #category : #convenience }
GraphVizGraph >> rank: aString add: anObject [

	self subgraphDo:
		[self rank: #same.
		self add: aString.
		self add: anObject]
]

{ #category : #accessing }
GraphVizGraph >> styles [

	^ children select: [:each | each isStyle]
]

{ #category : #graphing }
GraphVizGraph >> subgraph: anObject do: aBlock [

	| subgraph |
	subgraph := currentGraphReceiver addNewSubgraph: anObject.
	currentGraphReceiver := subgraph.
		
	[aBlock value] ensure: [currentGraphReceiver := self]
]

{ #category : #graphing }
GraphVizGraph >> subgraphDo: aBlock [

	self subgraph: nil do: aBlock
]

{ #category : #accessing }
GraphVizGraph >> subgraphs [

	^ children select: [:each | each isGraph]
]

{ #category : #streaming }
GraphVizGraph >> writeContentsOn: stream withIndent: aNumber for: graph [

	children do: [:each | each writeOn: stream withIndent: aNumber + 1 for: self].

]

{ #category : #streaming }
GraphVizGraph >> writeHeaderOn: stream withIndent: aNumber [

	directed ifTrue: [stream nextPutAll: 'di'].
	stream
		nextPutAll: self nodeType;
		nextPut: $ .
		
	self id ifNotNilDo: [:name | stream nextPutAll: self safeId; nextPut: $ ].
	stream nextPutAll: '{'.
]

{ #category : #streaming }
GraphVizGraph >> writeTerminatorOn: stream withIndent: aNumber [

	stream cr.
	self indent: aNumber on: stream.
	stream nextPut: $}
]
