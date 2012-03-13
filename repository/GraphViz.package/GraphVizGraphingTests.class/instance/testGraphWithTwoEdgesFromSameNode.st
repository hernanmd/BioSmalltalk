as yet unclassified
testGraphWithTwoEdgesFromSameNode

	graph add: #A -> #B.
	graph add: #A -> #C.
	
	self should: [graph dot includesSubString: 'A -- B'].
	self should: [graph dot includesSubString: 'A -- C'].