testing
testDbName

	url := (BioEntrezUrl2 fromString: self baseUrl)
			dbName: 'nuccore';
			yourself.
	self assert: url dbName equals: 'nuccore'