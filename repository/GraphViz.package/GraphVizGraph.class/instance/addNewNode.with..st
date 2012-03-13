adding
addNewNode: anObject with: associations

	| node |
	node := self nodeNamed: anObject.
	node ifNotNil: [^ node].
	
	node := GraphVizNode new id: anObject; graph: self.
	
	node inheritedStyle: currentNodeStyle.
	^ self addNode: node with: associations