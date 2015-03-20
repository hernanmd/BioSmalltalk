testing
test9ProjectEquality

	| prj1 prj2 |
	
	user := BioUser named: 'TestUser1'.
	user2 := BioUser named: 'TestUser2'.

	prj1 := user addProject: self samplePrjName.
	prj2 := user2 addProject: self samplePrjName.
	
	self assert: prj1 = prj2.

