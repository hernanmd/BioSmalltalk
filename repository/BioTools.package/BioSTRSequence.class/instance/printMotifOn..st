printing
printMotifOn: aStream

	self motif notNil
		ifTrue: [ 
			aStream
				nextPutAll: self motif between: $( and: $);
				nextPutAll: self repeats asString ]