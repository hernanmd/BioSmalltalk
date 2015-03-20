writing
writeLabelOn: aStream

	aStream
		nextPutAll: self label between: $[ -> $];
		nextPutAll: GRPlatform current newline