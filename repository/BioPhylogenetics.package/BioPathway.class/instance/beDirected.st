accessing
beDirected
	" Set the receiver to be an directed graph, and re-generate the adjacency list. "

	self isUndirected
		ifTrue: [ ^ self ].
	undirected := false.
	self buildAdjList