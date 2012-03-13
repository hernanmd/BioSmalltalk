as yet unclassified
testInheritedStyleCascadesThroughSubgraphs

	graph add: #node with: {#color -> #blue.#shape -> #ellipse}.
	graph subgraphDo:
		[graph add: #node with: #shape -> #box.
		graph add: #A].
	
	graph add: #B.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #A) shape = #box].
	
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #B) shape = #ellipse]