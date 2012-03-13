testing
test1ProjectCreation

	BioApplication release.
	user := BioUser named: 'user1'.

	self assert: user userProjects isCollection.
	self assert: user userProjects isEmpty.

	self assert: ( ( user addProject: self samplePrjName ) isKindOf: BioProject ).

	self assert: user userProjects isCollection.
	self deny: user userProjects isEmpty.
	self assert: user userProjects size = 1.
