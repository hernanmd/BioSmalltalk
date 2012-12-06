accessing
formatters
	" Answer a Collection of GTFormatter "
	
	^ formatters
		ifNil: [ formatters := OrderedCollection new ]