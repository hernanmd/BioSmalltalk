printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self rawUrl isNil
		ifFalse: [ 
			aStream 
				nextPutAll: (BioWebClientEngine decode: url asString)
				between: $[ -> $] ].
	