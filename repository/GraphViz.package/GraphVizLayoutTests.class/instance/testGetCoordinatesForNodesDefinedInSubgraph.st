as yet unclassified
testGetCoordinatesForNodesDefinedInSubgraph

	| node |
	graph subgraphDo: [node := graph add: #A].
	graph doLayout.
	
	self should: [node x > 0].
	self should: [node y > 0].
	self should: [node height > 0].
	self should: [node width > 0]