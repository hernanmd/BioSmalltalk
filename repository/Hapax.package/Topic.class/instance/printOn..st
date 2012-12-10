printing
printOn: aStream

	self basicPrintOn: aStream.
	aStream space print: self color.