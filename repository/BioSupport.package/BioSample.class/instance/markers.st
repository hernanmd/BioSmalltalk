accessing
markers
	" Answer a <Collection> of receiver's markers (possibly of <BioGenotypeCollection>) "
	
	^ markers
		ifNil: [ markers := OrderedCollection new ]