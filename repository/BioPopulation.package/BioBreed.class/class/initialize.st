initialize-release
initialize
	" Private - initialize breed repositories "

	self repositories: nil.
	self faoSpecies do: [: speciesName |
		self repositories add: (BioPopRepository new name: speciesName) ]