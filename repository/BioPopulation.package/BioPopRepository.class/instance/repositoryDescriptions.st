accessing
repositoryDescriptions

	self repositoryVersions isEmpty 
		ifTrue: [ self initializeRepositoryVersions ].
	^ self repositoryVersions collect: #name