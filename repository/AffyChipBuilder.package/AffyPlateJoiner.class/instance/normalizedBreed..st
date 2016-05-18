normalization
normalizedBreed: aString

	^ self breedMappings
		at: aString asLowercase 
		ifPresent: [ : f | f ] 
		ifAbsent: [ aString ]