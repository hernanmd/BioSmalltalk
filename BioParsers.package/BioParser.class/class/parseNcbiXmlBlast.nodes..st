parse-ncbi-xml
parseNcbiXmlBlast: aString nodes: nodesCollection
	" Parse with nodesCollection and answer a <Collection> of nodes found in aString "
	
	^ (BioNCBIXMLBlastParser on: aString)
		selectNodes: nodesCollection;
		parse