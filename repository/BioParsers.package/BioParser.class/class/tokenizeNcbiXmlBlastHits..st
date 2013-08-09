parse-ncbi-xml
tokenizeNcbiXmlBlastHits: xmlString
	" Answer a Collection of hit nodes found in xmlString "
	
	" needs work "
	^ (BioNCBIXMLBlastParser on: xmlString) tokenizeHits