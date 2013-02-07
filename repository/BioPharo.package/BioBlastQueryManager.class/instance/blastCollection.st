accessing
blastCollection
	^ blastCollection
		ifNil: [blastCollection := OrderedCollection new]