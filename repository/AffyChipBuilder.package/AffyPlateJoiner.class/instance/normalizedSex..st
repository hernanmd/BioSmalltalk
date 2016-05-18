normalization
normalizedSex: aString

	^ self sexMappings
		at: aString asLowercase 
		ifPresent: [ : f | f ] 
		ifAbsent: [ aString ]
