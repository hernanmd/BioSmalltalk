testing
checkParameters
	" Answer <true> if the receiver supports client parameters "
	
	^ self client rawUrl isNil not and: [ self client url asText isEmpty not ]