accessing
nodesCollectionClass

	^ nodesCollectionClass
		ifNil: [ nodesCollectionClass := self defaultNodesClass ]