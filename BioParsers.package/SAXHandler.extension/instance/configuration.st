*BioParsers
configuration

	^ configuration
		ifNil: [ configuration := self configurationClass new ].