as yet unclassified
testGetCoordinatesForNodes

	| node |
	graph add: #A -> #B.
	graph doLayout.
	
	node := graph nodeNamed: #A.
	self should: [node x > 0].
	self should: [node y > 0].
	self should: [node height > 0].
	self should: [node width > 0]