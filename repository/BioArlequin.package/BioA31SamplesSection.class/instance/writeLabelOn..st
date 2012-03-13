writing
writeLabelOn: aStream

	( self shouldWriteLabelOn: aStream )
		ifTrue: [
			aStream nextPutAll: '[Data]';
				cr.
			aStream nextPut: $[;
				nextPutAll: self class notation;
				nextPut: $]; 
				cr ]

			