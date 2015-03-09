accessing
nodeId: nodeId
	" Set ther receiver's client node id "

	self url queryAt: 'node_id' put: nodeId asString