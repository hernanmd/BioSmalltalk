printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self nodes
		ifNotNil: [ aStream nextPutAll: self nodes size asString between: $( -> $) ].