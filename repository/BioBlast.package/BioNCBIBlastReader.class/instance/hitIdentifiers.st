accessing-blast
hitIdentifiers
	" Answer a <Collection> of receiver's hit identifiers "

	self parsingStrategy ifNil: [ self setSAXTokenizer ].
	^ BioParser perform: self parsingStrategy withArguments: {contents . #('Hit_id')}