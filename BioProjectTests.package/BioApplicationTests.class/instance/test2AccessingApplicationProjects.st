testing
test2AccessingApplicationProjects

	BioApplication release.
	user1 := BioUser named: 'Test access app projects'.
	self assert: user1 applicationProjects isCollection.
	self assert: user1 applicationProjects isEmpty.
	

