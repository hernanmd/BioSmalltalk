as yet unclassified
testAccessAllEdgesViaRootGraph

	graph add: #A -> #B.
	graph subgraphDo: [graph add: #B -> #C].
	graph add: 123 -> 456.
		
	self should: [(graph edgeNamed: #A->#B) notNil].
	self should: [(graph edgeNamed: #B->#C) notNil].
	self should: [(graph edgeNamed: '123'->'456') notNil]