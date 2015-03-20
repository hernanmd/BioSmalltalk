accessing instance variables
users

	^ users
		ifNil: [ users := OrderedCollection new ]