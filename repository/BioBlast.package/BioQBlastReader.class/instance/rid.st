accessing-put
rid
	" Answer a String with the Request Identifier "
	
	| requestIdentifier |

	requestIdentifier := self parserForRID parse: self results.
	^ ( requestIdentifier beginsWith: 'Error' )
		ifTrue: [ self error: 'Couldn''t parse request identifier ', ( self parserForErrorMsg parse: self results ) ]
		ifFalse: [ requestIdentifier ]
