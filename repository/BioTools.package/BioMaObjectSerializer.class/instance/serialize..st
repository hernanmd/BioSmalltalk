accessing
serialize: anObject

	self provider
		fileOut: anObject 
		toFileNamed: self fileName 
		in: self workingDirectory.
	self doCompressionIn: self fileName.