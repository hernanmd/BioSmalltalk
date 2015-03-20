parse-ncbi-xml
saxTokenizeNcbiXmlBlastNodes: anObject
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer new
		selectNodes: BioNCBIBlastReader hitNodesNames;
		parse: anObject