accessing public
queryMolecularWeight: aNumberOrInterval
	" Answer a <String> to search the molecular weight in Daltons of the protein chain calculated from the amino acids only. This may not correspond to the molecular weight of the protein obtained from biological samples because of incomplete data or post-translational modifications of the protein in living systems. The colon ( : ) separates the beginning and end of a molecular weight range in Entrez "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aNumberOrInterval asEntrezMWString; 
			space;
			nextPutAll: self qualifierForGene ]