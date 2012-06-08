private
accessions: aStringCollection condition: cmpSymbol
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection accessionSet currentHits |
	
	accessionSet := aStringCollection asSet.
	currentHits := self hits asSet.
	self gtLog: 'Filtering from BLAST ' , aStringCollection size asString , ' accessions'.
	collection := 
		accessionSet collect: [ : srchStr |
			currentHits detect: [: node | node hitAccessions value perform: cmpSymbol with: srchStr ]. ].
	self gtLog: 'finished'.
	^ self addFilteredResultsFrom: collection