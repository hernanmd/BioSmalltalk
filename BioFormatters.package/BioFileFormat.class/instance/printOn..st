printing
printOn: aStream
	" See superimplementor's comment "
	
	aStream
		nextPutAll: self name;
		space;
		nextPut: $(.
	self extensions do: [: ext |
		aStream 
			nextPut: $.;
			nextPutAll: ext;
			space ].
	aStream
		nextPut: $)

		