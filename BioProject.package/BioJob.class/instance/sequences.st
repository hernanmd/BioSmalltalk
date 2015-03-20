accessing
sequences

	^ sequences
		ifNil: [ sequences := OrderedCollection new ]