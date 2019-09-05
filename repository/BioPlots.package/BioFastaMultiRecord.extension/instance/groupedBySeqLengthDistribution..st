*BioPlots
groupedBySeqLengthDistribution: aNumber
	" Answer a <Collection> of <BioFastaRecord> grouped by sequence length "
	
	^ RTDistribution new 
		objects: self records;
		metric: #size;
		frequencyWithAmountOfIntervals: aNumber