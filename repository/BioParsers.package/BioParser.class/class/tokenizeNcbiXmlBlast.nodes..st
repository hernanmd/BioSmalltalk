parse-ncbi-xml
tokenizeNcbiXmlBlast: aString nodes: aCollection
	" Answer a Collection of hit nodes found in aString "
	
	| parser |
	
	parser := BioNCBIXMLBlastParser on: aString.
	^ parser tokenizeNodes: aCollection.