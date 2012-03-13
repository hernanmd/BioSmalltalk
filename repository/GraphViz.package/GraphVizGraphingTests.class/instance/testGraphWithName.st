as yet unclassified
testGraphWithName

	graph name: 'g'.
	self should: [graph dot beginsWith: 'graph g {'].
	self should: [graph dot last = $}]