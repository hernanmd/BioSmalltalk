printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	organization
		ifNotNil: [
			aStream 
				space;
				nextPutAll: self classificationsSize asString between: $( -> Character space;
				nextPutAll: 'in'; 
				nextPutAll: self classesSize asString between: Character space -> $) ]
