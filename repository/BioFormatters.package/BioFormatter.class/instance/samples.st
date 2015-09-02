accessing
samples

	^ samplesCollection
		ifNil: [ samplesCollection := OrderedCollection new ]