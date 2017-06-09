accessing
samples
	" Answer a <Collection> of <BioVCFRecordSample> with genotype calls "
	
	^ samples
		ifNil: [ samples := OrderedCollection new ]
