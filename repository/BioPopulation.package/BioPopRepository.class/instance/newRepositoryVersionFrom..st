accessing
newRepositoryVersionFrom: repositoryImporterClass

	^ BioPopRepositoryVersion new 
		repository: self; 
		importer: repositoryImporterClass;
		name: repositoryImporterClass repositoryName