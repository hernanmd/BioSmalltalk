accessing
parseString: aString
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	self beSuccess.
	^ [ parser
			parse:  aString
			onError: [: failure | self error: failure message ] ]
		on: Exception
		do: [: ex | 
			self beFailed.
			ex asString ].
