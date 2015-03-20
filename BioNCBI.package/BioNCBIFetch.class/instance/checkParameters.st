testing
checkParameters
	" Answer <true> if the receiver supports client parameters "
	
	^ (self client rawUrl notNil
			and: [ self client rawGetUrl notNil ])
			and: [ self client getUrl rid notEmpty ]