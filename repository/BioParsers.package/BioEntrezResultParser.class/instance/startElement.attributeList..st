accessing
startElement: elementName attributeList: attributeList
	" Private - See superimplementor's comment "
	
	( self selectedNodes includes: elementName )
		ifTrue: [ 
			self catchOn.
			current := elementName ]
