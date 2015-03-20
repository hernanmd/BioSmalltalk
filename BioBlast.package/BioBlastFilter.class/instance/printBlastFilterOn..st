printing
printBlastFilterOn: aStream
	" Private - Append receiver's information on aStream "

	| currentTime |
	currentTime := DateAndTime current.
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name; space;
		nextPutAll: self contents size asString , ' hits' between: $( -> $); space;
		nextPutAll: currentTime asDate asString; space;
		nextPutAll: currentTime asTime asString			
