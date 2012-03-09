instance creation
tokenizeNcbiXmlBlastHsps: aString
	" Answer a Collection of hsps (high scoring pairs) nodes found in aXMLString "
	
	^ ( BioNCBIXMLBlastParser on: aString ) parseHsps