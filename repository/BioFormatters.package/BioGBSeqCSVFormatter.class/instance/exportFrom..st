accessing
exportFrom: aCollection

	self initializeStream: aCollection.
	
	" Escribir la fila de columnas "
	self gbKeys	do: [: k |
		stream 
			nextPutAll: k;
			nextPut: self delimiterSourceCharacter ].	
	stream cr.
	" Escribir los valores "
	aCollection do: [: dict |
		self gbKeys do: [: key |
			stream 
				nextPutAll: ( dict at: key ifAbsent: [ '-' ] );
				nextPut: self delimiterSourceCharacter ].
			stream cr ].
		
	self 
		outputToFile: self outputFilename 
		contents: stream contents