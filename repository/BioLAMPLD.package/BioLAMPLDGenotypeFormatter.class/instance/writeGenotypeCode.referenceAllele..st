accessing
writeGenotypeCode: pedLine referenceAllele: refAllele

	(pedLine allButFirst: 2) do: [ : spacedAlleles |
		self outputFileStream 
			nextPutAll: (refAllele asDNANucleotide asLAMPLDGenotypeCode: (BioGenotype withSpacedAlleles: spacedAlleles)) asString ].
	self outputFileStream cr.