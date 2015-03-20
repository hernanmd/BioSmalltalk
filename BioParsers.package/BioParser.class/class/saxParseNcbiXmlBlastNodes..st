parse-ncbi-xml
saxParseNcbiXmlBlastNodes: anObject
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser new
		selectNodes: BioNCBIBlastReader hitNodesNames;
		parse: anObject