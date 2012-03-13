as yet unclassified
testSimplestGraph

	self should: [graph dot beginsWith: 'graph {'].
	self should: [graph dot last = $}]