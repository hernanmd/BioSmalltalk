instance creation
tokenizeNcbiXmlEntrezResultKeys: aString
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ BioEResultKeysParser parse: aString