accessing
createProjectNamed: aNameString for: creatorObject
	" Add a new project named aNameString to the receiver's projects "

	(self applicationProjects includesKey: aNameString)
		ifTrue: [ self signalDuplicateObject: aNameString ].
	^ self applicationProjects 
		at: aNameString
		put: (self projectClass named: aNameString creator: creatorObject)