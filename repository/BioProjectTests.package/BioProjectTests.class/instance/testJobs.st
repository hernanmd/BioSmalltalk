testing
testJobs

	self assert: (project isKindOf: BioProject).
	self assert: (project info isKindOf: PFProjectInformation).
	self assert: (project jobs isKindOf: Collection).
	
	self assert: project jobs isEmpty.
	self assert: project jobsCount equals: 0.
	self assert: project isProject.
	self assert: (project name isKindOf: String).
	