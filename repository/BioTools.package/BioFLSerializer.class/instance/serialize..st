accessing
serialize: anObject

	self serializer serialize: anObject.
	self doCompressionIn: self fileName.