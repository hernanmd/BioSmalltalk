streaming
writeHeaderOn: stream withIndent: aNumber

		stream cr.
		self indent: aNumber on: stream.
		self id ifNotNilDo:
			[:name | 
			stream
				nextPutAll: self nodeType;
				nextPut: $ ].
			
		self id ifNotNilDo: [:name | stream nextPutAll: self safeId; nextPut: $ ].
		stream nextPutAll: '{'.
