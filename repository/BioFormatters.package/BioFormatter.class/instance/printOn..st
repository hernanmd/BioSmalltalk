printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self descriptionName 
		between: Character space -> Character space
