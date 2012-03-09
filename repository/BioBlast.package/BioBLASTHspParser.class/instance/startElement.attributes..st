content
startElement: elementName attributes: attributeList

	( self selectedNodes includes: elementName )
		ifTrue: [ self saveNodeAttributes: elementName ]