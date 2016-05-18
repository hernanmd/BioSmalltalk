accessing
sexMappings

	^ sexMappings
		ifNil: [ sexMappings := self initializeSexMappings ]