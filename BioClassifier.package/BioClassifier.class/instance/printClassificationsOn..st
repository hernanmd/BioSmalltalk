printing
printClassificationsOn: aStream

	aStream 
		space;
		nextPutAll: self classificationsSize asString between: $( -> Character space;
		nextPutAll: 'in'; 
		nextPutAll: self classesSize asString between: Character space -> $)
