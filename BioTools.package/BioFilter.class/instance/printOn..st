printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	self contents isNil
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ aStream
					nextPut: $(;
					nextPutAll: self contents size asString;
					nextPut: $) ]