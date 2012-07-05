accessing
openRepositoryBrowser 

	| speciesList breedMatrix table |
	
	speciesList := self bioSpecies.
	breedMatrix := 
		( BioMatrixFormatter new initMatrixRows: speciesList size columns: 3 )
			 atColumn: 1 fillWith: ((speciesList collect: #names) collect: #asArray);
			 atColumn: 2 fillWith: ((speciesList collect: #synonyms) collect: #asArray);
			 atColumn: 3 fillWith: ((speciesList collect: #locations) collect: #asArray);
			yourself.
	table := ( GridMorph 
			from: breedMatrix
			performing: {
				'Names' -> #first .
				'Synonyms' -> #second .
				'Locations' -> #third } ) 
				title: 'Browsing ' , speciesList size asString , ' species' translated.
	table 
		openInWorld;
		layoutChanged.