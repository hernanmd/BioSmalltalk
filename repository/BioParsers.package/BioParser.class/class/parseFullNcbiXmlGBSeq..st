parse-ncbi-xml
parseFullNcbiXmlGBSeq: aString
	" Answer a <Collection> of header nodes found in aString "

	^ BioEntrezXMLGBFullParser parse: aString