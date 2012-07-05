printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: self name between: ' (' -> ')'