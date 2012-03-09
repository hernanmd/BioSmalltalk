accessing
decode: aString
	" See superimplementor's comment "

	^ ( self urlClass decodeUrlEncodedForm: aString ) keys anyOne