accessing-blast
hitNodes

	^ self 
		selectNodes: BioNCBIBlastReader hitNodesNames 
		in: self results