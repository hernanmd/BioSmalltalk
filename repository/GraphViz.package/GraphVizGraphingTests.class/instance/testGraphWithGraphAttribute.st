as yet unclassified
testGraphWithGraphAttribute

	graph add: #graph with: #start -> #rand.
	self should: [graph dot includesSubString: 'graph [start=rand];']