accessing
downloadUrl
	" See superimplementor's comment "

	| cUrl |
	
	cUrl := self urlClass fromString: self url asString.
	^ cUrl asString

