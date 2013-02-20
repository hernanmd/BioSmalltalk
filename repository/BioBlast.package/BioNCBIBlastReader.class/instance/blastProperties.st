accessing-properties
blastProperties
	^ blastProperties
		ifNil: [blastProperties := OrderedCollection new]