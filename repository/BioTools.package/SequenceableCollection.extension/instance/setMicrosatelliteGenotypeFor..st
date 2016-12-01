*BioTools
setMicrosatelliteGenotypeFor: aBioMicrosatellite
	" Set the receiver's first two elements as the allele size range of aBioMicrosatellite "

	aBioMicrosatellite
		alleleRangeStart: self first;
		alleleRangeEnd: self second.