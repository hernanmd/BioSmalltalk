accessing
repositoryVersions
	" Answer a <Collection> of repository containers and populate them if they are configured for import on demand "

	^ repositoryVersions
		ifNil: [ 
			self initializeRepositoryVersions.
			repositoryVersions ]