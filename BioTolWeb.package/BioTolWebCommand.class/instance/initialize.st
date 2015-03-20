initialize
initialize
	" Private - Configure the receiver's URL object with the receiver's service name "

	self url: (BioWebClientEngine urlFromString: (self url asString , self baseUrl))
