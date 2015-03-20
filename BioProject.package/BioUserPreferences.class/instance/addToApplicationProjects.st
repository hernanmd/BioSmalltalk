accessing
addToApplicationProjects

	^ addToApplicationProjects
		ifNil: [ addToApplicationProjects := self defaultAddToApplicationProjects ]