Class {
	#name : #GraphVizLayoutTests,
	#superclass : #GraphVizBaseTests,
	#category : 'GraphViz-Tests'
}

{ #category : #'as yet unclassified' }
GraphVizLayoutTests >> testGetCoordinatesForEdges [
	
	| edge |
	edge := graph add: #A -> #B.
	graph doLayout.
	
	self should: [edge vertices size = 4].
	self should: [edge vertices first isPoint].
	self should: [edge vertices first x > 0].
	self should: [edge vertices first y > 0]
]

{ #category : #'as yet unclassified' }
GraphVizLayoutTests >> testGetCoordinatesForNodes [

	| node |
	graph add: #A -> #B.
	graph doLayout.
	
	node := graph nodeNamed: #A.
	self should: [node x > 0].
	self should: [node y > 0].
	self should: [node height > 0].
	self should: [node width > 0]
]

{ #category : #'as yet unclassified' }
GraphVizLayoutTests >> testGetCoordinatesForNodesDefinedInSubgraph [

	| node |
	graph subgraphDo: [node := graph add: #A].
	graph doLayout.
	
	self should: [node x > 0].
	self should: [node y > 0].
	self should: [node height > 0].
	self should: [node width > 0]
]
