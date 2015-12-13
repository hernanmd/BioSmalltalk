accessing
formatters
	" Answer a <Collection> of <BioFormatter> "
	
	^ formatters
		ifNil: [ formatters := OrderedCollection new ]