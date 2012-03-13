adding
addNewNode: anObject with: associations

	| node |
	node := self rootGraph nodeNamed: anObject.
	
	^ node 
		ifNil: [super addNewNode: anObject with: associations]
		ifNotNil: [self addNode: node with: associations]