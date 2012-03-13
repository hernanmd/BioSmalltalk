as yet unclassified
testModelContainsSubgraphs

	graph subgraph: #foo do: [graph add: #A].
		
	self should: [graph nodes isEmpty].
	
	self should: [graph subgraphs size = 1].
	self should: [graph subgraphs first id = #foo].
	
	self should: [graph subgraphs first nodes size = 1].
	self should: [graph subgraphs first nodes first id = #A].