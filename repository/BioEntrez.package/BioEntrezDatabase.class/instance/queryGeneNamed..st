accessing public
queryGeneNamed: aGeneName
	" Answer a <String> to search specific organism in Entrez "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aGeneName; 
			space;
			nextPutAll: self qualifierForGene ]