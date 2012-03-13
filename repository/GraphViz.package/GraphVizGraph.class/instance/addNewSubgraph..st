adding
addNewSubgraph: anObject

	| subgraph |
	subgraph := GraphVizSubgraph new
		id: anObject;
		parent: self;
		directed: directed;
		currentNodeStyle: currentNodeStyle;
		currentEdgeStyle: currentEdgeStyle;
		yourself.
		
	^ self addNewChild: subgraph