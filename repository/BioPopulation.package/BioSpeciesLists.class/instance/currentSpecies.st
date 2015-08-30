accessing
currentSpecies
	^ currentSpecies
		ifNil: [ currentSpecies := self defaultSpeciesList ]