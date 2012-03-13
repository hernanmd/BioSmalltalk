as yet unclassified
testGetCoordinatesForEdges
	
	| edge |
	edge := graph add: #A -> #B.
	graph doLayout.
	
	self should: [edge vertices size = 4].
	self should: [edge vertices first isPoint].
	self should: [edge vertices first x > 0].
	self should: [edge vertices first y > 0]