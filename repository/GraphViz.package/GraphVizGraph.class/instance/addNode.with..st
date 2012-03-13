private
addNode: aGraphVizNode with: associations

	| atts |
	atts := associations asOrderedCollection.
	
	atts do: [:each | aGraphVizNode attributeAt: each key put: each value].
	
	nodes at: aGraphVizNode id asString put: aGraphVizNode.
	^ self addNewChild: aGraphVizNode