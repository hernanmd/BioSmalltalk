parse-ncbi-xml
saxTokenizeNcbiXmlBlast: anObject nodes: nodes conditionBlock: aBlock
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer new
		conditionBlock: aBlock;
		selectNodes: nodes;
		parse: anObject