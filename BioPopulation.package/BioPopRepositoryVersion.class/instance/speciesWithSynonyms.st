accessing
speciesWithSynonyms
	" Answer a <Collection> of receiver's species with non-empty synonyms "
	
	^ self bioSpecies select: #hasSynonym