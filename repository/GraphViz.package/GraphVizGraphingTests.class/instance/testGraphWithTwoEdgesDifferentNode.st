as yet unclassified
testGraphWithTwoEdgesDifferentNode

	graph add: #A -> #B.
	graph add: #B -> #C.
	
	self should: [graph dot includesSubString: 'A -- B'].
	self should: [graph dot includesSubString: 'B -- C'].