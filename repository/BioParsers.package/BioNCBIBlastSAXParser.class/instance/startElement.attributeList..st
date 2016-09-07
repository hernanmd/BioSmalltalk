content
startElement: elementName attributeList: attributeList
	" Private - Included because older version of the SAX parser contains this method "

	current := nil.
	(self selectedNodes includes: elementName)
		ifTrue: [ (current := results nodeFor: elementName)
				ifNotNil: [ :arg | current addToRoot: results ] ]