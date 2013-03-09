accessing
multimers
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAMultimers new client: self)