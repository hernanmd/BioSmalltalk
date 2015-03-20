testing
test2ProjectAccessing

	user := BioUser named: 'TestUser1'.

	user addProject: self samplePrjName.
	self assert: ( ( user projectINamed: self samplePrjName ) isKindOf: BioProjectInformation ).
	self assert: ( ( user projectNamed: self samplePrjName ) isKindOf: BioProject ).
	
	self should: [ user projectNamed: 'NonExistantProject1' ] raise: BioNotFoundObject.
