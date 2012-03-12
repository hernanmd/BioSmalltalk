parse-ncbi-xml
parseNcbiXmlBlastNodes: aString nodes: aCollection
	" Answer a Collection of header nodes found in aXMLString "
	
	^ ( BioNCBIXMLBlastParser on: aString ) parseNodes: aCollection