printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	self contents isNil
		ifTrue: [ aStream nextPutAll: 'Empty Blast Filter' ]
		ifFalse: [ | currentTime |
			currentTime := 	DateAndTime current.
			 aStream
					nextPutAll: currentTime asDate asString; space;
					nextPutAll: currentTime asTime asString;					
					nextPut: $:;
					nextPutAll: self contents size asString;
					nextPutAll: ' hits' ]