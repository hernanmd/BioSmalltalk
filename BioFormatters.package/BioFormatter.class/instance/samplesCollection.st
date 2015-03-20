accessing
samplesCollection

	^ samplesCollection
		ifNil: [ samplesCollection := OrderedCollection new ]