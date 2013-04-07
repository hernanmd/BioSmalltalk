accessing-blast-filters
hitAccessionsAsString
	" Answer a Collection with the accession Strings from the receiver's results "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ (BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_accession')}) 
		collect: [: id | id accessionId asString ]
