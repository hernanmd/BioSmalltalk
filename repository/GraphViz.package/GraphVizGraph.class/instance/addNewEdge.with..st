adding
addNewEdge: anAssociation with: associations

	| edge atts |
	atts := associations asOrderedCollection.
	
	edge := GraphVizEdge new id: anAssociation.
	atts do: [:each | edge attributeAt: each key put: each value].

	"ensure edge nodes are already in node list"
	edge fromNode: (self addNewNode: anAssociation key).
	edge toNode: (self addNewNode: anAssociation value).
	
	edges at: anAssociation key asString -> anAssociation value asString put: edge.
	edge inheritedStyle: currentEdgeStyle.
	
	^ self addNewChild: edge