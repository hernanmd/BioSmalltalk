Class {
	#name : #GraphVizGraphModelTests,
	#superclass : #GraphVizBaseTests,
	#category : 'GraphViz-Tests'
}

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testAccessAllEdgesViaRootGraph [

	graph add: #A -> #B.
	graph subgraphDo: [graph add: #B -> #C].
	graph add: 123 -> 456.
		
	self should: [(graph edgeNamed: #A->#B) notNil].
	self should: [(graph edgeNamed: #B->#C) notNil].
	self should: [(graph edgeNamed: '123'->'456') notNil]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testAccessAllNodesViaRootGraph [

	graph add: #A.
	graph subgraphDo: [graph add: #B].
	graph add: 123.
		
	self should: [(graph nodeNamed: #A) notNil].
	self should: [(graph nodeNamed: #B) notNil].
	self should: [(graph nodeNamed: #C) isNil].
	self should: [(graph nodeNamed: '123') notNil]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testInheritedStyle [

	graph add: #node with: #color -> #blue.
	graph add: #A.
	graph add: #B.
	graph add: #C with: #color -> #yellow.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #C) color = #yellow].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testInheritedStyleCascadesThroughSubgraphs [

	graph add: #node with: {#color -> #blue.#shape -> #ellipse}.
	graph subgraphDo:
		[graph add: #node with: #shape -> #box.
		graph add: #A].
	
	graph add: #B.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #A) shape = #box].
	
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #B) shape = #ellipse]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testInheritedStylesAreCumulative [

	graph add: #node with: #color -> #blue.
	graph add: #A.
	
	graph add: #node with: #shape -> #box.
	graph add: #B -> #C.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #B) shape = #box].
	self should: [(graph nodeNamed: #C) color = #blue].
	self should: [(graph nodeNamed: #C) shape = #box]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testInheritedStylesAreDistinctForNodesAndEdges [

	graph add: #node with: #color -> #blue.
	graph add: #edge with: #color -> #yellow.

	graph add: #A.
	graph add: #A->#B.
		
	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph edgeNamed: #A->#B) color = #yellow]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testInheritedStylesMaintainedIfNodesPutIntoSubgraph [

	graph := GraphViz new
		add: #node with: #fontsize -> 16;
		add: #A;
		add: #node with: #fontsize -> 10;
		yourself.
	graph subgraphDo: [graph add: #A].
		
	self should: [(graph nodeNamed: #A) fontSize = 16]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testLoopThroughAllEdges [

	| items |
	graph add: #A -> #B.
	graph subgraphDo: [graph add: #C -> #A].
	
	items := OrderedCollection new.
	graph allEdgesDo: [:each | items add: each].
	
	self should: [items size = 2].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testLoopThroughAllNodes [

	| items |
	graph add: #A.
	graph add: #B.
	graph subgraphDo: [graph add: #C -> #A].
	
	items := OrderedCollection new.
	graph allNodesDo: [:each | items add: each].
	
	self should: [items size = 3].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelContainsAttributes [

	graph addAttribute: #A -> #B.
	
	self should: [graph attributes size = 1].
	self should: [graph attributes first key = #A].
	self should: [graph attributes first value = #B].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelContainsEdges [

	graph add: #A -> #B.
	
	self should: [graph edges size = 1].
	self should: [graph edges first id = (#A -> #B)].
	
	self should: [graph nodes size = 2].
	self should: [graph nodes first id = #A].
	self should: [graph nodes second id = #B].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelContainsManyNodesWhenUsingEdgesWithNestedAssociations [

	graph add: #A -> #B -> #C.
	
	self should: [graph nodes size = 3].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelContainsNodes [

	graph add: #A.
		
	self should: [graph nodes size = 1].
	self should: [graph nodes first id = #A].
	
	graph add: #B.
	self should: [graph nodes size = 2].
	self should: [graph nodes second id = #B].

]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelContainsSubgraphs [

	graph subgraph: #foo do: [graph add: #A].
		
	self should: [graph nodes isEmpty].
	
	self should: [graph subgraphs size = 1].
	self should: [graph subgraphs first id = #foo].
	
	self should: [graph subgraphs first nodes size = 1].
	self should: [graph subgraphs first nodes first id = #A].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelRecordsOnlyUniqueNodes [

	| newNode |
	graph add: #A.
		
	self should: [graph nodes size = 1].
	self should: [graph nodes first id = #A].
	
	newNode := graph add: #A.
	self should: [graph nodes size = 1].
	self should: [newNode = (graph nodeNamed: #A)]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelRecordsOnlyUniqueNodesEvenInSubgraphs [

	graph add: #A.
	graph subgraphDo: [graph add: #A].
	
	self should: [graph nodes size = 1].
	self should: [graph subgraphs first nodes size = 1].
	self should: [graph nodes first = graph subgraphs first nodes first]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testModelWithStyle [

	graph add: #node with: #color -> #blue.		
	self should: [graph nodes isEmpty].
	
	self should: [graph styles size =1].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testObjectsHaveAttributes [

	graph add: #A with: #label -> 'A label'.
		
	self should: [graph nodes first attributes size = 1].
	self should: [(graph nodes first attributes at: #label) = 'A label'].
	
	graph add: #B with: {#foo -> #bar. #doo -> #boo}.
	self should: [graph nodes second attributes size = 2]
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testSubgraphInSubgraphs [

	graph subgraph: #foo do:
		[graph subgraph: #bar do: [graph add: #A]].
		
	self should: [graph nodes isEmpty].
	
	self should: [graph subgraphs size = 1].
	self should: [graph subgraphs first id = #foo].
	self should: [graph subgraphs first nodes isEmpty].
	
	self should: [graph subgraphs first subgraphs size = 1].
	self should: [graph subgraphs first subgraphs first id = #bar].
	self should: [graph subgraphs first subgraphs first nodes size = 1].
	self should: [graph subgraphs first subgraphs first nodes first id = #A].
]

{ #category : #'as yet unclassified' }
GraphVizGraphModelTests >> testSubgraphsVsGraphs [

	self should: [graph isGraph].
	self shouldnt: [graph isSubgraph].
	
	graph subgraph: #foo do: [].
	self should: [graph subgraphs first isGraph].	
	self should: [graph subgraphs first isSubgraph].
	
	graph subgraphDo: [graph rank: #same].
	
	self should: [graph attributes isEmpty].
	self should: [graph subgraphs last attributes size = 1]

]
