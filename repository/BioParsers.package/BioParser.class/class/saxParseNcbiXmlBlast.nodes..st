parse-ncbi-xml
saxParseNcbiXmlBlast: anObject nodes: aCollection
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXParser new
		selectNodes: aCollection;
		parse: anObject