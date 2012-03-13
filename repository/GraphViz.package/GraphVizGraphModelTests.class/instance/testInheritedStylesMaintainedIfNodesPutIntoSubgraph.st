as yet unclassified
testInheritedStylesMaintainedIfNodesPutIntoSubgraph

	graph := GraphViz new
		add: #node with: #fontsize -> 16;
		add: #A;
		add: #node with: #fontsize -> 10;
		yourself.
	graph subgraphDo: [graph add: #A].
		
	self should: [(graph nodeNamed: #A) fontSize = 16]