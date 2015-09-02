writing
writeLabelOn: aStream
	aStream
		nextPutAll: self class notation between: $[ and: $];
		nextPut: Character cr