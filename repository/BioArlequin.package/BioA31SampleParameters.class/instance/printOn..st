printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPutAll: self size greaseString 
		between: $( and: $)