printing
printOn: aStream
	" Private - See superimplementor´s comment "
	
	super printOn: aStream.
	self rawUrl isNil
		ifFalse: [ 
			aStream 
				nextPutAll: (self decode: url asString)
				between: $[ -> $] ].
	