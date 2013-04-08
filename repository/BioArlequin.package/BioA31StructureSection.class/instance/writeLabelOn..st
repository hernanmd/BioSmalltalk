writing
writeLabelOn: aStream
	aStream
		nextPutAll: self class notation between: $[ -> $];
		nextPut: Character cr