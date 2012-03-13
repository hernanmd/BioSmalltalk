accessing
parseDocuments
	" Answer a Collection of Dictionaries with qualifier -> value associations "
	
	^ ( self collect: [: r | r parseDocument ] ) joinUsing: self species new