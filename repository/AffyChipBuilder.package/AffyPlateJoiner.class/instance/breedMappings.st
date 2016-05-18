accessing
breedMappings

	^ breedMappings 
		ifNil: [ breedMappings := self initializeBreedMappings ]