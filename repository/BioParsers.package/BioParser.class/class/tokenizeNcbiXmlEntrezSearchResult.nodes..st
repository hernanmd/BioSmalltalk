instance creation
tokenizeNcbiXmlEntrezSearchResult: aString nodes: aCollection
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ (( BioEntrezResultParser on: aString readStream ) selectNodes: aCollection) parseDocument