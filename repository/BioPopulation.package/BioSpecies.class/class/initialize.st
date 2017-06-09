initialize-release
initialize
	" Private - initialize species repositories "

	self release.
	BioSpeciesLists currentSpeciesList do: [: speciesName | | repo |
		repo := self newRepositoryForOrganism: speciesName.
		self repositories add: repo.
		repo initializeRepositoryVersions ].
	self bioLog: 'Imported repositories: ' , BioPopRepositoryVersion allInstances size asString.