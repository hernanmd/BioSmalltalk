testing
testEmailAddress

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl.
	url emailAddress: 'test@test.com'.
	
	self assert: ( url valueForParameter: 'email' ) = 'test@test.com'