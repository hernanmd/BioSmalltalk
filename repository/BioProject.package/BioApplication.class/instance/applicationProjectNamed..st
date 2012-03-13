accessing
applicationProjectNamed: aNameString
	" Answer a GTProjectInformation "

	^ self applicationProjects
			at: aNameString
			ifAbsent: [ self signalNotFound: aNameString ] 