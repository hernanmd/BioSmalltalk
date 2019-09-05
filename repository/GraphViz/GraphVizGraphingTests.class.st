Class {
	#name : #GraphVizGraphingTests,
	#superclass : #GraphVizBaseTests,
	#category : 'GraphViz-Tests'
}

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testAnonymousSubGraph [

	graph subgraphDo:
		[graph add: #A].
	
	self should: [(graph dot lineNumber: 2) = '	{'].
	self should: [(graph dot lineNumber: 3) = '		A;'].
	self should: [(graph dot lineNumber: 4) = '	}'].
	self should: [(graph dot lineNumber: 5) = '}'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testDirectedGraphWithOneEdge [

	graph beDirected.
	graph add: #A -> #B.
	
	self should: [graph dot includesSubString: '	A -> B;'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphToMorph [

	graph add: #A.
	
	self should: [graph asMorph height > 0]
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphToXml [

	graph add: #A.
	graph add: #B -> #C.
	
	self 
		should: [Smalltalk includesKey: #XMLDOMParser]
		description: 'Need YAXO package to run this test and use asXml feature of graphs'.
	self should: [graph asXml topElement localName = #gxl]
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithDoubleQuotedId [

	graph add: 'HI THERE'.
	self should: [(graph dot lineNumber: 2) = '	"HI THERE";'] 
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithEdgeAttribute [

	graph add: #edge with: #dir -> #both.
	self should: [graph dot includesSubString: 'edge [dir=both];']
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithGraphAttribute [

	graph add: #graph with: #start -> #rand.
	self should: [graph dot includesSubString: 'graph [start=rand];']
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithName [

	graph name: 'g'.
	self should: [graph dot beginsWith: 'graph g {'].
	self should: [graph dot last = $}]
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithNodeAttribute [

	graph add: #node with: #shape -> #box.
	self should: [graph dot includesSubString: 'node [shape=box];']
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithOneEdge [

	graph add: #A -> #B.
	
	self should: [graph dot includesSubString: '	A -- B;'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithOneNode [

	graph add: #A.
	self should: [(graph dot lineNumber: 2) = '	A;'] 
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithSimpleAttribute [

	graph at: #label put: #title.
	self should: [(graph dot lineNumber: 2) = '	label=title;']
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithSpecificNodeAttribute [

	graph add: #A with: #shape -> #box.
	self should: [(graph dot lineNumber: 2) = '	A [shape=box];'] 
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithSpecificNodeAttributes [

	graph add: #A with: {#shape -> #box. #fontname -> #trebuc}.
	self should: [(graph dot lineNumber: 2) includesSubString:  'shape=box'].
	self should: [(graph dot lineNumber: 2) includesSubString:  'fontname=trebuc'] 
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithTwoEdgesDifferentNode [

	graph add: #A -> #B.
	graph add: #B -> #C.
	
	self should: [graph dot includesSubString: 'A -- B'].
	self should: [graph dot includesSubString: 'B -- C'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithTwoEdgesFromSameNode [

	graph add: #A -> #B.
	graph add: #A -> #C.
	
	self should: [graph dot includesSubString: 'A -- B'].
	self should: [graph dot includesSubString: 'A -- C'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testGraphWithTwoNodes [

	graph add: #A.
	graph add: #B.
	
	self should: [(graph dot lineNumber: 2) = '	A;'].
	self should: [(graph dot lineNumber: 3) = '	B;'] 
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testSafeIds [

	self should: [(graph safeIdFor: #A) = #A].
	self should: [(graph safeIdFor: 10) = '10'].
	self should: [(graph safeIdFor: '"10"') = '"10"'].
	self should: [(graph safeIdFor: '<TABLE> </TABLE>') = '<TABLE> </TABLE>'].
	
	self should: [(graph safeIdFor: '10ABC') = '"10ABC"'].
	self should: [(graph safeIdFor: 'ABC DEF') = '"ABC DEF"'].
	self should: [(graph safeIdFor: 'ABC-DEF') = '"ABC-DEF"'].
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testSimplestDirectedGraph [

	graph beDirected.
	self should: [graph dot beginsWith: 'digraph {'].
	self should: [graph dot last = $}]
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testSimplestGraph [

	self should: [graph dot beginsWith: 'graph {'].
	self should: [graph dot last = $}]
]

{ #category : #'as yet unclassified' }
GraphVizGraphingTests >> testSubGraph [

	graph subgraph: #nested do:
		[graph add: #A].
	
	self should: [(graph dot lineNumber: 2) = '	subgraph nested {'].
	self should: [(graph dot lineNumber: 3) = '		A;'].
	self should: [(graph dot lineNumber: 4) = '	}'].
	self should: [(graph dot lineNumber: 5) = '}'].
]
