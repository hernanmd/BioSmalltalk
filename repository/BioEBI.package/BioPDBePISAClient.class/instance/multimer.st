accessing
multimer
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAPDBMultimer new client: self)