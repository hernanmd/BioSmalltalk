as yet unclassified
testModelContainsNodes

	graph add: #A.
		
	self should: [graph nodes size = 1].
	self should: [graph nodes first id = #A].
	
	graph add: #B.
	self should: [graph nodes size = 2].
	self should: [graph nodes second id = #B].
