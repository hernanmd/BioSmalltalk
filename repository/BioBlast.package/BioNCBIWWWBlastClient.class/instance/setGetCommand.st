accessing public - commands
setGetCommand
	" Set the receiver's command to GET "
	
	cmd isNil
		ifTrue: [ cmd := BioNCBIGet new client: self ]
		ifFalse: [ cmd isGet
					ifFalse: [ cmd := BioNCBIGet new client: self ] ].
	( self getUrl includesParameter: BioNCBICommand cmdString )
		ifFalse: [ self getUrl startParameters: cmd baseUrl ].				