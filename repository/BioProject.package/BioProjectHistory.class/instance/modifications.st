accessing
modifications

	^ modifications
		ifNil: [ modifications := OrderedCollection new ]