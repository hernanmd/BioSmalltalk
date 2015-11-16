accessing
initializeReferenceAlleles

	^ (self newParserFor: self bimFilePath) rowsCollect: [ : bimRow | bimRow at: 5 ] 