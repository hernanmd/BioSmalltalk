parse-ncbi-xml
parseNcbiXmlBlast: aString nodes: aCollection
	" Answer a Collection of header nodes found in anObject "
	
	^ (BioNCBIXMLBlastParser on: aString)
		selectNodes: aCollection;
		parse