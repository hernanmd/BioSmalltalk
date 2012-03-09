testing
checkParameters
	" Answer <true> if the receiver supports client parameters "
	
	^ self client parameters allSatisfy: [: par |
		self validParameters includes: par ]