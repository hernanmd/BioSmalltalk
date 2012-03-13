as yet unclassified
testAccessAllNodesViaRootGraph

	graph add: #A.
	graph subgraphDo: [graph add: #B].
	graph add: 123.
		
	self should: [(graph nodeNamed: #A) notNil].
	self should: [(graph nodeNamed: #B) notNil].
	self should: [(graph nodeNamed: #C) isNil].
	self should: [(graph nodeNamed: '123') notNil]