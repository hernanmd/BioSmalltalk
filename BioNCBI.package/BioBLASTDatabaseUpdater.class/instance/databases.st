updating
databases
	" Answer a Collection with all available pre-formatted BLAST databases "
		
	self connect
		ifNotNil: [ self extractDatabaseNames: self client getFileList ]
		ifNil: [ self inform: 'Connection failed' translated ].
	self client close.
	^ self dbNames asSortedCollection