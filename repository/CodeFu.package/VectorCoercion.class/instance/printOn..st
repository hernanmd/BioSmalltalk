printing
printOn: aStream 

	aStream 
		print: self class; 
		nextPutAll: ' with: ';
		print: number