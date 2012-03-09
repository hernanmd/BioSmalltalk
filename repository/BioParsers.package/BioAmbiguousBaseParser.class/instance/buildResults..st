accessing
buildResults: aCollection
	" Set the receiver's results using aCollection "
	
	^ self results: ( BioSequence
		newWith: aCollection
		alphabet: BioIUPACAmbiguousDNA )
