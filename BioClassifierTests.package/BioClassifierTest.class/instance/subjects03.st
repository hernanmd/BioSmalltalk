accessing
subjects03
	" Answer a <Collection> of BioSequence objects "
	
	^ self observations03 collect: [: str | str asSequence ]