printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	self printNameOn: aStream.
	aStream 
		space;
		nextPutAll: self size asString 
		between: $( -> $)