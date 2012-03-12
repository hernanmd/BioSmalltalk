parse-ncbi-xml
tokenizeNcbiXmlBlast: aString nodes: aCollection
	" Answer a Collection of hit nodes found in aString "
	
	^ ( BioNCBIXMLBlastParser on: aString ) tokenizeNodes: aCollection