accessing-blast-filters
hitAccessions
	" Answer a Collection with the accession objects from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: #accessionId

