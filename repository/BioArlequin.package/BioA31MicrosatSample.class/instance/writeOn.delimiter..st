accessing
writeOn: aStream delimiter: aDelimiterCharacter
	" Write the receiver's data into aStream "
	
	" The raw data consist here of the allelic state of one or an arbitrary number of microsatellite loci. For each locus, one should provide the number of repeats of the microsatellite motif as the allelic definition, if one wants his data to be analyzed according to the step-wise mutation model (for the analysis of genetic structure). It may occur that the absolute number of repeats is unknown. If the difference in length between amplified products is the direct consequence of changes in repeat numbers, then the minimum length of the amplified product could serve as a reference, allowing to code the other alleles in terms of additional repeats as compared to this reference. If this strategy is impossible, then any other number could be used as an allelic code, but the stepwise mutation model could not be assumed for these data. "
	
	super writeOn: aStream.
	aStream
		nextPutAll: self allele1;
		nextPut: aDelimiterCharacter;
		nextPutAll: self allele2;
		cr
		
		