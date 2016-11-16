private
chromosomeList

	| maxChrNum |
		
	maxChrNum := BioSpeciesLists faoSpeciesWithChr at: self speciesSetting.
	^ (OrderedCollection with: 'All')
			addAll: (1 to: maxChrNum) asOrderedCollection;
			yourself