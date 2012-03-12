parse-ncbi-xml
tokenizeNcbiXmlEntrezSearchResult: aString nodes: aCollection
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ (( BioXMLParser on: aString readStream ) 
				selectNodes: aCollection) tokenizeNodes