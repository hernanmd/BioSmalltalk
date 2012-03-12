accessing
buildResults: aCollection
	" Set the receiver's results using aCollection "
	
	^ BioSequence
		newWith: aCollection
		alphabet: BioIUPACAmbiguousDNA
