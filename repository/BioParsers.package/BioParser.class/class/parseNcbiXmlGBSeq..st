instance creation
parseNcbiXmlGBSeq: aString
	" Answer a Collection of header nodes found in aXMLString "
	
	^ BioEntrezXMLGBBasicParser parse: aString