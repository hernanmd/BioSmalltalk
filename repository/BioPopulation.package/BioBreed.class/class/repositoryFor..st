accessing
repositoryFor: speciesName
	" Scan population repositories classes for speciesName and answer the corresponding class if found, or raise an exception "
	
	(self repositories isEmpty and: [ self initializeRepositoryOnDemand ])
		ifTrue: [ 
			self initialize.
			BioPopImporter initializeFor: speciesName ].
	^ self repositories detect: [ : repo | repo name = speciesName ]