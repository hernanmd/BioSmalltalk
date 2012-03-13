as yet unclassified
testDirectedGraphWithOneEdge

	graph beDirected.
	graph add: #A -> #B.
	
	self should: [graph dot includesSubString: '	A -> B;'].