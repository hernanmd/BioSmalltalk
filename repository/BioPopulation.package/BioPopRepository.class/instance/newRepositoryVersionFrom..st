accessing
newRepositoryVersionFrom: repositoryImporterClass

	self halt.
	^ BioPopRepositoryVersion new 
		repository: self; 
		importer: repositoryImporterClass;
		name: repositoryImporterClass repositoryName