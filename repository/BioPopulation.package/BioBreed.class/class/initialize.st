initialize-release
initialize
	" Private - initialize breed repositories "

	self release.
	self faoSpecies do: [: speciesName |
		self repositories add: (BioPopRepository new name: speciesName) ]