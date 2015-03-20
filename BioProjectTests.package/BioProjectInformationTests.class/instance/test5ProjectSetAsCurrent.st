testing
test5ProjectSetAsCurrent

	| curProj |
	
	BioApplication release.
	user := BioUser named: 'user1'.
	
	curProj := user addProject: self samplePrjName.	
	curProj beCurrentFor: user.
	self assert: user currentProject = curProj.
	self assert: curProj isCurrent
