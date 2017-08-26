printing
printNameOn: aStream

	self hasName
		ifTrue: [ 
			aStream
				space;
				nextPutAll: self name between: $[ and: $] ]
		ifFalse: [ 
			aStream
				space;
				nextPutAll: 'Unnamed' between: $[ and: $] ].