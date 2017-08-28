writing
writeLabelOn: aStream

	aStream
		nextPutAll: self label between: $[ and: $];
		nextPutTerminator