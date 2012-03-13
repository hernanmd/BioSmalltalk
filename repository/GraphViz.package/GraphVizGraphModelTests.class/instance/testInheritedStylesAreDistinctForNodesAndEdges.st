as yet unclassified
testInheritedStylesAreDistinctForNodesAndEdges

	graph add: #node with: #color -> #blue.
	graph add: #edge with: #color -> #yellow.

	graph add: #A.
	graph add: #A->#B.
		
	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph edgeNamed: #A->#B) color = #yellow]