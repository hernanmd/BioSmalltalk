as yet unclassified
testInheritedStylesAreCumulative

	graph add: #node with: #color -> #blue.
	graph add: #A.
	
	graph add: #node with: #shape -> #box.
	graph add: #B -> #C.

	self should: [(graph nodeNamed: #A) color = #blue].
	self should: [(graph nodeNamed: #B) color = #blue].
	self should: [(graph nodeNamed: #B) shape = #box].
	self should: [(graph nodeNamed: #C) color = #blue].
	self should: [(graph nodeNamed: #C) shape = #box]