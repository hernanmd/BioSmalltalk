accessing
addRepositoryVersion: repositoryVersionName
	" Add a aRepositoryVersion to the receiver's versions "
	
	repositoryVersions isNil
		ifTrue: [repositoryVersions := Set new ].
	repositoryVersions add: (BioPopRepositoryVersion new 
		repository: self; 
		name: repositoryVersionName)