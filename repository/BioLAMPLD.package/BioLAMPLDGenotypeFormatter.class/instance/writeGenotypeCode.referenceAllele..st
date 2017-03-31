accessing
writeGenotypeCode: pedLine referenceAllele: refAllele

	(pedLine allButFirst: self columnsToSkip) do: [ : spacedAlleles |
		self outputFileStream 
			nextPutAll: (refAllele asDNANucleotide asLAMPLDGenotypeCode: (BioGenotype withSpacedAlleles: spacedAlleles)) asString ].
	self outputFileStream nextPutTerminator.