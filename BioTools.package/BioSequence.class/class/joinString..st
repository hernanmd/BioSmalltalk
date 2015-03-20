convenience
joinString: aCollection
	" Private - Answer a String with the sequence ensambled from aCollection.
	aCollection is a collection of collections with each element composed by
	Strings or Characters "
	
	^ (aCollection flatCollect: [ : each | each select: #isString ]) joinUsing: String empty