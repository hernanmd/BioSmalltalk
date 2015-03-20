printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	self subclasses isEmpty
		ifTrue: [ aStream nextPutAll: self codonTables size asString ]