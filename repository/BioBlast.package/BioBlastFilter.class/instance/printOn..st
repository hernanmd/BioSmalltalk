printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	self contents isNil
		ifTrue: [ aStream nextPutAll: 'Empty Blast Filter' ]
		ifFalse: [ aStream
					nextPutAll: DateAndTime current asString;
					space;
					nextPutAll: 'Blast filter with: ';
					nextPutAll: self contents size asString;
					nextPutAll: ' hits' ]