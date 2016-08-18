parse-ncbi-xml
tokenizeNcbiXmlBlastHeader: aString
	" Answer a <Collection> of header nodes found in aXMLString "
	
	^ (BioNCBIXMLBlastParser on: aString) tokenizeHeader