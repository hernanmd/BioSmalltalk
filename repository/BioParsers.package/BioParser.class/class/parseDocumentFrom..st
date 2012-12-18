parse-ncbi-xml
parseDocumentFrom: anObject
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser new
		selectNodes: BioNCBIBlastSAXParser allNodeNames;
		parse: anObject