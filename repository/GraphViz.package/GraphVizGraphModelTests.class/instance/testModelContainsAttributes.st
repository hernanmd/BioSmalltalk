as yet unclassified
testModelContainsAttributes

	graph addAttribute: #A -> #B.
	
	self should: [graph attributes size = 1].
	self should: [graph attributes first key = #A].
	self should: [graph attributes first value = #B].