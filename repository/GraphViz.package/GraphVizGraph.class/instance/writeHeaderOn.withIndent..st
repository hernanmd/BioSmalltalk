streaming
writeHeaderOn: stream withIndent: aNumber

	directed ifTrue: [stream nextPutAll: 'di'].
	stream
		nextPutAll: self nodeType;
		nextPut: $ .
		
	self id ifNotNilDo: [:name | stream nextPutAll: self safeId; nextPut: $ ].
	stream nextPutAll: '{'.