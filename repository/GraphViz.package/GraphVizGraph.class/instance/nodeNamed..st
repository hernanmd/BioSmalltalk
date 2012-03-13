accessing
nodeNamed: anObject

	| node nodeId |
	nodeId := anObject asString.
	node := nodes at: nodeId ifAbsent: [nil].
	
	node ifNil:
		[self subgraphs do:
			[:each |
			node := each nodeNamed: nodeId.
			node ifNotNil: [^ node]]].
	
	^ node