as yet unclassified
testGraphWithEdgeAttribute

	graph add: #edge with: #dir -> #both.
	self should: [graph dot includesSubString: 'edge [dir=both];']