testing
test4ProjectRenaming

	BioApplication release.
	user := BioUser named: 'user1'.
	user addProject: self samplePrjName.
	
	self assert: ( ( user renameProject: self samplePrjName to: 'testProject1Renamed' ) isKindOf: BioProjectInformation ).
	self assert: ( ( user projectINamed: 'testProject1Renamed' ) isKindOf: BioProjectInformation ).
	self assert: ( ( user projectNamed: 'testProject1Renamed' ) isKindOf: BioProject ).
	
	self should: [ user renameProject: self samplePrjName to: 'testProject1Renamed' ] raise: BioNotFoundObject.
	self should: [ user projectINamed: self samplePrjName ] raise: BioNotFoundObject.
	self should: [ user projectNamed: self samplePrjName ] raise: BioNotFoundObject.

