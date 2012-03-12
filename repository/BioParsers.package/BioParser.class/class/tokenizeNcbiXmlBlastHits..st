parse-ncbi-xml
tokenizeNcbiXmlBlastHits: aString
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ ( BioNCBIXMLBlastParser on: aString ) tokenizeHits