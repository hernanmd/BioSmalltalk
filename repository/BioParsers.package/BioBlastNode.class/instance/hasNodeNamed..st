testing
hasNodeNamed: aNodeName
	^ self nodes anySatisfy: [ :node | node nodeName = aNodeName ]