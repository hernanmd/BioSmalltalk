testing
testDbName

	url := (BioEntrezUrl fromString: self baseUrl)
			dbName: 'nuccore';
			yourself.
	self assert: url dbName equals: 'nuccore'