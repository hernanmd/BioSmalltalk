testing
prvProjectExists: aNameString

	^ ( self userProjects 
		detect: [ : prj | prj name = aNameString ]
		ifNone: [ nil ] ) isNil not
	