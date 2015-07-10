comparing
= aBioBlastNode
	" Answer whether the receiver and anObject represent the same object. "

	^ super = aBioBlastNode and: [ self nodes = aBioBlastNode nodes ]
