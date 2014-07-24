initialize-release
initialize
	" Private - initialize species repositories "

	self release.
	self faoSpecies do: [: speciesName | | repo |
		repo := self newRepositoryForSpecies: speciesName.
		self repositories add: repo.
		repo initializeRepositoryVersions ]