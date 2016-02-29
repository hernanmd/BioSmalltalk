accessing projects
projectINamed: aNameString
	" Answer a BioProjectInformation named aNameString or raise an exception if not found "
	
	^ (self userProjects 
		detect: [ : prj | prj name = aNameString ]
		ifNone: [ self signalNotFound: aNameString ]) info