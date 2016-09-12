testing
test1UserCreation

	user := BioUser named: self userTestName.
	self assert: (user isKindOf: BioUser).
	self assert: user name equals: self userTestName.


