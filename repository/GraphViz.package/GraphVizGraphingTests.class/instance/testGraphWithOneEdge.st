as yet unclassified
testGraphWithOneEdge

	graph add: #A -> #B.
	
	self should: [graph dot includesSubString: '	A -- B;'].