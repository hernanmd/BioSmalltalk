accessing
selectedNodes

	^ nodes
		ifNil: [ nodes := BioNCBIBlastSAXParser hitNodesNames ]