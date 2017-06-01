initialize
initializeRelation: aCollection
	" Private - Initialize the receiver's using aCollection of <BioRelation> "
	
	self relations: aCollection.
	self graph: Dictionary new.
	self index: Dictionary new.
	undirected := false.
	self buildAdjList.