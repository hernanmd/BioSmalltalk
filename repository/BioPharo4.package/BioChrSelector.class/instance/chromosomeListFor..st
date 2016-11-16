private
chromosomeListFor: anOrganismString

	| maxChrNum |
		
	maxChrNum := BioSpeciesLists faoSpeciesWithChr at: anOrganismString.
	^ (OrderedCollection with: 'All')
			addAll: (1 to: maxChrNum) asOrderedCollection;
			yourself