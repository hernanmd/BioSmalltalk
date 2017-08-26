printing
printOn: aStream
	" Private - See superimplementor's comment "

	super printOn: aStream.
	self printNameOn: aStream.
	self printRangeOn: aStream.
	self printChrOn: aStream.
	self printLengthOn: aStream.
	self printValueOn: aStream