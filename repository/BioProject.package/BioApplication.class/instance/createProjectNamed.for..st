accessing
createProjectNamed: aNameString for: creatorObject
	" Add a new project named aNameString to the receiver's projects "

	( self applicationProjects includesKey: aNameString )
		ifTrue: [ self signalDuplicateObject: aNameString ].
	^ self applicationProjects 
		at: aNameString
		put: ( BioProject named: aNameString creator: creatorObject )