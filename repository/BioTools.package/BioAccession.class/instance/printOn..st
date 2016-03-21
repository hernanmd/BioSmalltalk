printing
printOn: aStream
	" Private - See superimplementor´s comment "

	super printOn: aStream.
	self names do: [ : n | aStream nextPutAll: n between: Character space and: Character space ].
	self version ifNotNil: [ :arg | aStream nextPutAll: self version ]