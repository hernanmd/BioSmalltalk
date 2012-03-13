accessing
applicationProjects

	^ applicationProjects
		ifNil: [ applicationProjects := Dictionary new ]