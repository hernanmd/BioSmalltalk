testing
test3ProjectRemoval

	BioApplication release.
	
	user := BioUser named: 'user1'.
	user addProject: self samplePrjName.
	
	self assert: ( ( user removeProject: self samplePrjName ) isKindOf: BioUser ).
	self assert: user userProjects isCollection.	
	self assert: user userProjects isEmpty.
	
	self should: [ user removeProject: 'NonExistantProject1' ] raise: BioNotFoundObject.

	
