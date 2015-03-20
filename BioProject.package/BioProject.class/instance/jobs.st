accessing
jobs

	^ jobs
		ifNil: [ jobs := OrderedCollection new ]