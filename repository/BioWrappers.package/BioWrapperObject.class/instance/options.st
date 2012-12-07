accessing private
options

	^ options
		ifNil: [ options := OrderedCollection new ]