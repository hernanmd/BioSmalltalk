content
startElement: elementName attributeList: attributeList
	" Private - Included because older version of the SAX parser contains this method "
	
	current := nil.
	( current := results nodeFor: elementName )
		ifNotNil: [ current addToRoot: results ]