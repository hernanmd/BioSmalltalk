parse-ncbi-xml
saxTokenizeNcbiXmlBlast: anObject nodes: aBlock
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer new
		selectNodes: aBlock;
		parse: anObject