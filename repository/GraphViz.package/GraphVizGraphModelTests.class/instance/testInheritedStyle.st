as yet unclassified
testInheritedStyle

	graph add: #node with: #color -> #blue.
	graph add: #A.
	graph add: #B.
	graph add: #C with: #color -> #yellow.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #C) color = #yellow].