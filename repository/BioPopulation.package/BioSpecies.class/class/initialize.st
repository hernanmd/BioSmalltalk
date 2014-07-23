initialize-release
initialize
	" Private - initialize species repositories "

	self release.
	self faoSpecies do: [: speciesName |
		self repositories add: (self newRepositoryForSpecies: speciesName) ]