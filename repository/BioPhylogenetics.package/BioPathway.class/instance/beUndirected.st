accessing
beUndirected
	" Set the receiver to be an undirected graph, and re-generate the adjacency list. The undirected graph can be converted to directed graph, however, the edge between two nodes will be simply doubled to both ends "

	self isDirected
		ifTrue: [ ^ self ].
	undirected := true.
	self buildAdjList