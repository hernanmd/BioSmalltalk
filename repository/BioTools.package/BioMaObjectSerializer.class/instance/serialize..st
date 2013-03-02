accessing
serialize: anObject
	" See superimplementor's comment "

	Cursor write showWhile: [ 	
		self provider
			fileOut: anObject 
			toFileNamed: self fileName 
			in: self workingDirectory.
		self doCompressionIn: self fileName ].