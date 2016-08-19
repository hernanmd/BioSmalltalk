content
startElement: elementName attributes: attributeList
	" Probably obsolete "

	current := nil.
	(self selectedNodes includes: elementName) ifTrue: [ 
		(current := results nodeFor: elementName)
			ifNotNil: [ current addToRoot: results ] ]