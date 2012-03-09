accessing
parseDocuments
	" Answer a Collection of Dictionaries with qualifier -> value associations "
	
	^ ( self collect: [: r | r parseDocument results ] ) joinUsing: self species new