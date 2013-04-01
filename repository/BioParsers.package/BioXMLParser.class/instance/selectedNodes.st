accessing
selectedNodes

	^ nodes
		ifNil: [ nodes := BioNCBIBlastReader hitNodesNames ]