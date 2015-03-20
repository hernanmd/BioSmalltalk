testing
testEmailAddress

	url := (BioEntrezUrl fromString: self baseUrl)
		emailAddress: 'test@test.com';
		yourself.
	self assert: (url valueForParameter: 'email') equals: 'test@test.com'