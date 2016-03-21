testing
test8LastProjects

	BioApplication release.
	user := BioUser named: 'user1'.
	1 to: 10 do: [ : index | user addProject: 'testProject' , index asString ].
	
	self assert: (user lastProjects: 5) size = 5.
	self assert: (user lastProjects: 0) isEmpty.
	self assert: ((user lastProjects: 2) at: 1) name = 'testProject9'.
	self assert: ((user lastProjects: 2) at: 2) name = 'testProject10'.
	self assert: ((user lastProjects: '1') at: 1) name = 'testProject10'.
	
	self should: [ user lastProjects: 11 ] raise: Error.
