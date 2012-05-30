accessing
serialize: anObject
	" See superimplementor comment "
	
	self provider serialize: anObject toFileNamed: self location.
	self doCompressionIn: self location.