accessing
subjects03
	" Answer a <Collection> of BioSequence objects "
	
	^ self featureVectors03 collect: [: str | str asSequence ]