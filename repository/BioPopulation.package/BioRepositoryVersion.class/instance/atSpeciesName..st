accessing
atSpeciesName: aString

	^ self locatedBioSpecies 
			detect: [: species | species includesName: aString ]
			ifNone: [ nil ]