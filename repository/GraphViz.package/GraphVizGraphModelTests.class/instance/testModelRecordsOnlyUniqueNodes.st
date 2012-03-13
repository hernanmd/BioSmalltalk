as yet unclassified
testModelRecordsOnlyUniqueNodes

	| newNode |
	graph add: #A.
		
	self should: [graph nodes size = 1].
	self should: [graph nodes first id = #A].
	
	newNode := graph add: #A.
	self should: [graph nodes size = 1].
	self should: [newNode = (graph nodeNamed: #A)]