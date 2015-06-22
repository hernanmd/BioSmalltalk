accessing
validate: aCollection 
	" See superimplementor's comment "
	
	isValid := aCollection allSatisfy: [ : item | item isValidForCSVFormat ].
	super validate: aCollection
