accessing
repositoryFor: aBreedString

	(self repositories isEmpty and: [ self initializeRepositoryOnDemand ])
		ifTrue: [ 
			self initialize.
			BioPopImporter initializeFor: aBreedString ].
	^ self repositories detect: [ : repo |
		repo name = aBreedString ]