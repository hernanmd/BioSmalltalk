as yet unclassified
testModelContainsEdges

	graph add: #A -> #B.
	
	self should: [graph edges size = 1].
	self should: [graph edges first id = (#A -> #B)].
	
	self should: [graph nodes size = 2].
	self should: [graph nodes first id = #A].
	self should: [graph nodes second id = #B].