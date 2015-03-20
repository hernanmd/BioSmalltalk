accessing
downloadUrl
	" See superimplementor's comment "

	^ (self urlClass decodeUrlEncodedForm: self url asString) keys anyOne