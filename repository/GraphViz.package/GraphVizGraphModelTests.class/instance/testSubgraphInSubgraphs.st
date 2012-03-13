as yet unclassified
testSubgraphInSubgraphs

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