testing
test05ProjectBasicAccess

	self assert: ( project isKindOf: BioProject ).
	self assert: ( project info isKindOf: BioProjectInformation ).
	self assert: ( project jobs isKindOf: Collection ).
	
	self assert: project jobs isEmpty.
	self assert: project jobsCount = 0.
	self assert: project isBioProject.
	self assert: ( project name isKindOf: String ).
	