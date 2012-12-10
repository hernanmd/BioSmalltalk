printing
printOn: aStream 
	"Append to the argument aStream a sequence of characters that identifies the matrix."

	aStream 
		print: self class; 
		nextPutAll: ' with: ';
		print: number