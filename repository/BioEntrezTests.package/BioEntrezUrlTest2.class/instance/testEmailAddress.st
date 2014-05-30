testing
testEmailAddress

	url := (BioEntrezUrl2 fromString: self baseUrl)
		emailAddress: 'test@test.com';
		yourself.
	self assert: (url valueForParameter: 'email') equals: 'test@test.com'