accessing
serialize: anObject

	self provider: ( self provider newFileNamed: self location ).
	self provider
			fileOutClass: nil "no class" 
			andObject: anObject.	
	self doCompressionIn: self location.