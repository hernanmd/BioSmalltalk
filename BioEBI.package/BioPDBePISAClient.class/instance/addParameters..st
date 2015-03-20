accessing
addParameters: aString
	" Add the parameters in aString to the receiver's url object "
	
	self url: (BioWebClientEngine urlFromString: self url asString , aString)