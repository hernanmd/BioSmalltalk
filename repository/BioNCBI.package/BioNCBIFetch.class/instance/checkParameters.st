testing
checkParameters
	" Answer <true> if the receiver supports client parameters "
	
	^ ( self client rawUrl isNil not and: [ self client rawGetUrl isNil not ] )
			and: [ self client getUrl rid isEmpty not ]