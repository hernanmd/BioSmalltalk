writing
writeLabelOn: aStream
	(self shouldWriteLabelOn: aStream)
		ifTrue: [ 
			aStream
				nextPutAll: '[Data]';
				nextPut: Character cr;
				nextPut: $[;
				nextPutAll: self class notation;
				nextPut: $];
				nextPut: Character cr ]