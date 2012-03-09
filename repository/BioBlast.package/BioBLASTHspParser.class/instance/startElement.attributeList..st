content
startElement: elementName attributeList: attributeList
	" Private - Included because older version of the SAX parser contains
	this method "
	
	( self selectedNodes includes: elementName )
		ifTrue: [ self saveNodeAttributes: elementName ]