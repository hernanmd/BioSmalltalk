printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self result
		ifNil: [ 	aStream nextPut: $0 ]
		ifNotNil: [ 
			aStream 
				nextPutAll: self result size asString 
				between: $[ -> $]
		]
