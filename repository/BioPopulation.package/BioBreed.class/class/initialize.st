initialize-release
initialize
	" Private - self initialize "

	self breedSpecies do: [: speciesName |
		self repositories add: ( BioRepository new name: speciesName ) ]