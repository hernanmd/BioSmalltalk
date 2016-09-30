accessing
ruleBases
	" Answer a <Collection> containing the receiver's rule base instances "

	^ ruleBases
		ifNil: [ ruleBases := Set new ]