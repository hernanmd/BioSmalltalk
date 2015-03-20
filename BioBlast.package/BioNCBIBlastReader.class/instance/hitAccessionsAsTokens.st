accessing-blast-filters
hitAccessionsAsTokens
	" Answer a Collection with the accession numbers tokenized from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: #asAccessionToken