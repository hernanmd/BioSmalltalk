exporting
writeFeatureRow: featureDictionary groupedFeature: aString 

	self stream 
		nextPut: $>;
		nextPutAll: (featureDictionary at: BioGBSeqCollection qualifierForAccessionWithVersion);
		cr;
		nextPutAll: (featureDictionary at: BioGBSeqCollection qualifierForAlignedSequence);
		cr