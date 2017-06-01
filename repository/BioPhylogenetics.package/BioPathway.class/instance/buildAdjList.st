private
buildAdjList
	" Private - Build an adjacency list from the receiver's relations "
	
	self clearGraph.
	self relations do: [ : rel | self addRelation: rel changed: false ]