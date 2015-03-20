accessing
createProjectNamed: aNameString
	" Add a project named aNameString to the receiver's projects, setting its user to the default user "
	| newProject |
	
	(self applicationProjects includesKey: aNameString)
		ifTrue: [ self signalDuplicateObject: aNameString ].
	newProject := self projectClass named: aNameString creator: (BioUser named: 'Unknown').
	self applicationProjects add: aNameString -> newProject.
	^ newProject