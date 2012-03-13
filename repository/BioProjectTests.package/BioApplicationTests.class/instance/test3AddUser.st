testing
test3AddUser

	user1 := BioUser named: self newUser1.
	self shouldnt: [ user1 userNamed: self newUser1 ] raise: BioNotFoundObject.
	self assert: ( user1 userNamed: self newUser1 ) name = self newUser1.
	
	user2 := BioUser named: self newUser2.
	self shouldnt: [ user2 userNamed: self newUser2 ] raise: BioNotFoundObject.
	self assert: ( user2 userNamed: self newUser2 ) name = self newUser2.
	

