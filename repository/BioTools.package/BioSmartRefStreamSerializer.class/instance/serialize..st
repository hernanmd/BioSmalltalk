accessing
serialize: anObject
	" See superimplementor's comment "

	Cursor write showWhile: [ 	
		self provider: (self provider newFileNamed: self location).
		self provider
				fileOutClass: nil "no class" 
				andObject: anObject.	
		self doCompressionIn: self location ].