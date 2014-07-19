accessing
addRepositoryVersionFromImporter: repositoryImporterClass
	" Add a repositoryImporterClass to the receiver's versions "
	
	repositoryVersions isNil
		ifTrue: [repositoryVersions := Set new ].
	repositoryVersions add: (self newRepositoryVersionFrom: repositoryImporterClass)