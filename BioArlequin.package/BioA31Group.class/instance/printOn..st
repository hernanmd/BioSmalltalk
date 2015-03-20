printing
printOn: aStream

	aStream 
		nextPutAll: self name
		between: $[ -> $].
	self data printOn: aStream.