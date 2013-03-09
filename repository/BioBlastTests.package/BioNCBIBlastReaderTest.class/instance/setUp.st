accessing
setUp

	super setUp.
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.