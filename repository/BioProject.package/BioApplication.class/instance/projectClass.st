accessing
projectClass
	^ projectClass
		ifNil: [ projectClass := BioProject ]