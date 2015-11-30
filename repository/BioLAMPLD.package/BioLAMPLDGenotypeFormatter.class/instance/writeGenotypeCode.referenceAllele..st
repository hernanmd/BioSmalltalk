accessing
writeGenotypeCode: pedLine referenceAllele: refAllele

	(pedLine allButFirst: 2) do: [ : spacedAlleles |
		self outputFile 
			nextPutAll: (refAllele asDNANucleotide asLAMPLDGenotypeCode: (BioGenotype withSpacedAlleles: spacedAlleles)) asString ].
	self outputFile cr.