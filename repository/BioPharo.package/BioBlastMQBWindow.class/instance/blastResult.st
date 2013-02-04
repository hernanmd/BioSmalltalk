accessing
blastResult
	^ blastResult
		ifNil: [blastResult := BioNCBIBlastResult new]