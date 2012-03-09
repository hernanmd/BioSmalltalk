content
startElement: elementName attributes: attributeList
	" Probably obsolete "
	
	current := results nodeFor: elementName.
	current addToRoot: results.