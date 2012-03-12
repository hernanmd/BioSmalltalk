accessing
exportFrom: aCollection interval: interval

	self initializeStream: aCollection.
	
	" Escribir la fila de columnas "
	self gbKeys	allButLast do: [: k |
		stream 
			nextPutAll: k;
			nextPut: self delimiterSourceCharacter ].
	" Escribir las posiciones "
	interval do: [ : pos | 
		stream 
			nextPutAll: pos asString;
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