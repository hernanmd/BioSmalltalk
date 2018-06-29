running
setUp

	BioProject resetApplication.
	PFProjectApplication applicationClass: BioPFTestApp.
	project := (BioUser named: 'TestUser1') addProject: 'testProject1'.
