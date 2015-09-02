printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self description 
		between: Character space 
		and: Character space
