accessing
startElement: elementName attributes: attributeList
	" Private - See superimplementor's comment "
	
	( self selectedNodes includes: elementName )
		ifTrue: [ 
			self catchOn.			
			current := elementName ]