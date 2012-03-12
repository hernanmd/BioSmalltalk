parse-ncbi-xml
tokenizeNcbiXmlEntrezSearchResult: aString
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ BioEntrezResultParser parse: aString