initialize
initializeRepositoryVersions

	self names do: [ : aName |
		BioImporter initializeFor: aName ].
