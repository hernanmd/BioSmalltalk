accessing
parameters

	^ parameters
		ifNil: [ parameters := OrderedCollection new ]