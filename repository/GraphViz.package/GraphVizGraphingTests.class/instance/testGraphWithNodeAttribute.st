as yet unclassified
testGraphWithNodeAttribute

	graph add: #node with: #shape -> #box.
	self should: [graph dot includesSubString: 'node [shape=box];']