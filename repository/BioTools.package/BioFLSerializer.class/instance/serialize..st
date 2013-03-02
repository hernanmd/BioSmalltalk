accessing
serialize: anObject
	" See superimplementor comment "
	
	Cursor write showWhile: [ 	
		self provider serialize: anObject toFileNamed: self location.
		self doCompressionIn: self location ].