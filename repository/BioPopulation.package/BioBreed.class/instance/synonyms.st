accessing
synonyms

	^ synonyms
		ifNil: [ synonyms := OrderedCollection new ]	