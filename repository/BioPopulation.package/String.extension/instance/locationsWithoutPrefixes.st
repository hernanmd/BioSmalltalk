*BioPopulation
locationsWithoutPrefixes
	" Answer a <Collection> of Strings with receiver's locations without common prefixes "

	^ OrderedCollection with: self bioRemovePrefixes 