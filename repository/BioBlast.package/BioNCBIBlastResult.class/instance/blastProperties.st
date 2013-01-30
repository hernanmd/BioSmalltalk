accessing
blastProperties
	^ blastProperties
		ifNil: [blastProperties := OrderedCollection new]