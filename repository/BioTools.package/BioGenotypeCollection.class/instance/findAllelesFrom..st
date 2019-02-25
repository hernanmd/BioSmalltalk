initialization
findAllelesFrom: aCollection

	^ aCollection 
		select: [ : aString | aString isAllele ]
		thenCollect: [ : genotypeString | BioGenotype withSpacedAlleles: genotypeString ]