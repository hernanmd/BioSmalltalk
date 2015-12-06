printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		space;
		nextPutAll: self name fullName between: $( and: $).