accessing
groupedBySeqLength
	" Answer a <Collection> of <BioFastaRecord> grouped by sequence length "
	
	^ self records groupedBy: #size