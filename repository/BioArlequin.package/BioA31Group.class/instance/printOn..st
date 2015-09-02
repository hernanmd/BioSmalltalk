printing
printOn: aStream

	aStream 
		nextPutAll: self name
		between: $[ and: $].
	self data printOn: aStream.