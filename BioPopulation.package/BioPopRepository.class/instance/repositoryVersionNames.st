accessing
repositoryVersionNames
	" Answer a <Collection> with names of repository for the receiver "
	
	^ self repositoryVersions collect: #name