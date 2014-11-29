accessing
atBreedName: aString

	^ self locatedBioSpecies 
			detect: [: species | species includesName: aString ]
			ifNone: [ BioNullBreed new ]