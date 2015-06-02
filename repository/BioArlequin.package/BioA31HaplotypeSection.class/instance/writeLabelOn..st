printing
writeLabelOn: aStream
	(self shouldWriteLabelOn: aStream)
		ifTrue: [ 
			aStream
				nextPut: Character cr;
				nextPutAll: self class notation between: $[ -> $];
				nextPut: Character cr ]