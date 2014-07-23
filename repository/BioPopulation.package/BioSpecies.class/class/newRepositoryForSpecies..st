initialize-release
newRepositoryForSpecies: speciesName

	^ (BioPopRepository new name: speciesName)
		initializeRepositoryVersions;
		yourself.