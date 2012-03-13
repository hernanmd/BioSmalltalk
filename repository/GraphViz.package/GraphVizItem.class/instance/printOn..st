printing
printOn: aStream

	aStream 
		nextPutAll: self nodeType;
		nextPut: $ ;
		nextPutAll: self id asString