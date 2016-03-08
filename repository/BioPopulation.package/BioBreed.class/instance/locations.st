accessing
locations
	" Answer a <Collection> of receiver's locations "

	^ locations
		ifNil: [ locations := OrderedCollection new ]