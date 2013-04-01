parse-ncbi-xml
parseDocumentFrom: anObject
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser new
		selectNodes: BioNCBIBlastReader allNodeNames;
		parse: anObject