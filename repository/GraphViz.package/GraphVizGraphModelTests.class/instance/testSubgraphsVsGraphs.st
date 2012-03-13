as yet unclassified
testSubgraphsVsGraphs

	self should: [graph isGraph].
	self shouldnt: [graph isSubgraph].
	
	graph subgraph: #foo do: [].
	self should: [graph subgraphs first isGraph].	
	self should: [graph subgraphs first isSubgraph].
	
	graph subgraphDo: [graph rank: #same].
	
	self should: [graph attributes isEmpty].
	self should: [graph subgraphs last attributes size = 1]
