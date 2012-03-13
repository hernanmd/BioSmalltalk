printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	self territory printOn: aStream.
	self samples printOn: aStream.
		