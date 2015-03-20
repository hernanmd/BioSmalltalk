accessing
interfaces
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAInterfaces new client: self)