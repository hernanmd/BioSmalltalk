testing
test1AddProject

	BioApplication release.
	user1 := BioUser named: self newUser1.
	user1 addProject: self newProjectName1.
	
	self shouldnt: [ user1 applicationProjectNamed: self newProjectName1 ] raise: BioNotFoundObject.
	self assert: ( user1 applicationProjectNamed: self newProjectName1 ) name = self newProjectName1.
	self assert: ( ( user1 addProject: self newProjectName1 ) isKindOf: BioProject ).
	
	user1 addProject: self newProjectName2.
	self shouldnt: [ user1 applicationProjectNamed: self newProjectName2 ] raise: BioNotFoundObject.
	self assert: ( user1 applicationProjectNamed: self newProjectName2 ) name = self newProjectName2.
	self assert: ( ( user1 addProject: self newProjectName2 ) isKindOf: BioProject ).
	

