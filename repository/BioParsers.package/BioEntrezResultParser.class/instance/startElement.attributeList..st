accessing
startElement: elementName attributeList: attributeList
	" Private - See superimplementor's comment "
	
	( self selectedNodes includes: elementName )
		ifFalse: [ ^ self ].
	self catchOn.
	current := elementName
