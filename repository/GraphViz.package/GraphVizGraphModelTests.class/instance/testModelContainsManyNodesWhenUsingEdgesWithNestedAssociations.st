as yet unclassified
testModelContainsManyNodesWhenUsingEdgesWithNestedAssociations

	graph add: #A -> #B -> #C.
	
	self should: [graph nodes size = 3].