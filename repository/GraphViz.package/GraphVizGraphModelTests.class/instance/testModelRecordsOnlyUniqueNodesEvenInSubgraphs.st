as yet unclassified
testModelRecordsOnlyUniqueNodesEvenInSubgraphs

	graph add: #A.
	graph subgraphDo: [graph add: #A].
	
	self should: [graph nodes size = 1].
	self should: [graph subgraphs first nodes size = 1].
	self should: [graph nodes first = graph subgraphs first nodes first]