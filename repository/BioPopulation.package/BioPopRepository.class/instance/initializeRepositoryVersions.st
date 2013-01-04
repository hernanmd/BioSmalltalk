initialize
initializeRepositoryVersions

	self names do: [ : aName |
		BioPopImporter initializeFor: aName ].
