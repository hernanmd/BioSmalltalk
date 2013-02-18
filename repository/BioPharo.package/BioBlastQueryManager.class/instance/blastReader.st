accessing
blastReader
	^ blastReader
		ifNil: [blastReader := BioNCBIBlastReader new]