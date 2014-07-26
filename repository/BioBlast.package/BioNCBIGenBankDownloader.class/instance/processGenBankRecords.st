accessing-entrez
processGenBankRecords
	" Answer a <BioGBSeqCollection> if current results are valid, nil otherwise "

	[ self parsedResults:  (BioGBSeqCollection newFromXMLCollection: self results) parseDocuments.
	self inform: 'Dowloaded GenBank records are valid' translated ]
	on: XMLWellFormednessException 
	do: [ : ex | self inform: 'XML is not well formed, if you downloaded data please try again'.
		^ nil ].
	^ self results