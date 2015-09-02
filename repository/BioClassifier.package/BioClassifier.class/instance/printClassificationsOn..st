printing
printClassificationsOn: aStream

	aStream 
		space;
		nextPutAll: self classificationsSize asString between: $( and: Character space;
		nextPutAll: 'in'; 
		nextPutAll: self classesSize asString between: Character space and: $)
