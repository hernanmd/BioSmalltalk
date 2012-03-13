accessing
userProjects

	^ userProjects
		ifNil: [ userProjects := OrderedCollection new ]