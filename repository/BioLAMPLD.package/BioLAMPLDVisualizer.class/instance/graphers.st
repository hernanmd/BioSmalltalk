accessing
graphers
	^ graphers
		ifNil: [ graphers := OrderedCollection new ]