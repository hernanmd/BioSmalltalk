accessing
parseDocuments
	" Answer a Collection of Dictionaries with qualifier -> value associations "
	
	| collection |
	
	collection := self species new: self size.
	self 
		do: [ : doc | collection addLast: doc parseDocument ]
		displayingProgress: 'Parsing...'.
	^ collection joinUsing: self species new