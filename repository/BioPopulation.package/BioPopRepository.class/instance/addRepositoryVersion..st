accessing
addRepositoryVersion: aRepositoryVersion
	" Add a aRepositoryVersion to the receiver's versions "
	
	repositoryVersions ifNil: [ repositoryVersions := Set new ].
	repositoryVersions add: aRepositoryVersion