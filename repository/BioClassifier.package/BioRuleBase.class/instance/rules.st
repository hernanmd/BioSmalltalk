accessing
rules
	^ rules
		ifNil: [ rules := OrderedCollection new ]