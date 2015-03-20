accessing
database: aStringOrSymbol
	" Set the receiver's working database "
	
	" Validate only if we have cached database names, may need work. "
	self dbNames isEmpty
		ifFalse: [ 
			( self dbNames includes: aStringOrSymbol )
				ifFalse: [ self signalInvalidObject: aStringOrSymbol , ' does not exist as database in the server' ] ].
	selectedDbName := aStringOrSymbol