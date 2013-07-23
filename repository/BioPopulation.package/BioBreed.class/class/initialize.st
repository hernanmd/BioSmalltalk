initialize-release
initialize
	" Private - self initialize "

	self faoSpecies do: [: speciesName |
		self repositories add: ( BioPopRepository new name: speciesName ) ]