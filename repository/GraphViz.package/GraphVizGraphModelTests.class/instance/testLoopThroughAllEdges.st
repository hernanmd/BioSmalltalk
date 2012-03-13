as yet unclassified
testLoopThroughAllEdges

	| items |
	graph add: #A -> #B.
	graph subgraphDo: [graph add: #C -> #A].
	
	items := OrderedCollection new.
	graph allEdgesDo: [:each | items add: each].
	
	self should: [items size = 2].