accessing
locations

	^ locations
		ifNil: [ locations := OrderedCollection new ]