instance creation
parseNcbiXmlBlastNodes: anObject
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser parse: anObject readStream