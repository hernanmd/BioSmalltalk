downloading
connect
	" Private - Connect the receiver's to download databases "
	
	[ self client: (self clientClass openOnHostNamed: self serverName).
	self client loginUser: self serverUser password: self serverPassword ]
	on: NetworkError, LoginFailedException
	do: [ : ex | self connectionRetry 
				ifFalse: [ self error: 'Connection failed.'. ^ nil ] ].