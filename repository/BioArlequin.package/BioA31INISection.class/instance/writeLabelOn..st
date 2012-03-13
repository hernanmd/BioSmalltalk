writing
writeLabelOn: aStream

	aStream 
		nextPutAll: self label between: $[ -> $]; 
		cr.