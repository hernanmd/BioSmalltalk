content
startElement: elementName attributes: attributeList
	" Probably obsolete "
	
	current := nil.
	( current := results nodeFor: elementName )
		ifNotNil: [ current addToRoot: results ]