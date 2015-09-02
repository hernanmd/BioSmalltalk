printing
printOn: aStream
	" Private - See superimplementor´s comment "
	
	super printOn: aStream.
	self names do: [ : n |
		aStream 
			nextPutAll: n
			between: Character space and: Character space ].
	self version
		ifNotNil: [ aStream nextPutAll: self version ].