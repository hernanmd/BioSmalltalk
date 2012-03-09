accessing nodes
selectNodeNamed: aNodeName
	" Answer the node named aNodeName "
	
	^ self nodes 
			detect: [ : node | node nodeName = aNodeName ]
			ifNone: [ nil ]
