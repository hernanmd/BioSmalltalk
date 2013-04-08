writing
writeLabelOn: aStream
	aStream
		nextPutAll: self label between: $[ -> $];
		nextPut: Character cr