accessing-blast
hitNodes

	^ self 
		selectNodes: BioNCBIBlastSAXParser hitNodesNames 
		in: self results