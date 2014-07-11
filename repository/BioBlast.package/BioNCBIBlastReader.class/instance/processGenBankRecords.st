accessing-entrez
processGenBankRecords
	" Answer a <BioGBSeqCollection> for the current reader's results "

	^ (BioGBSeqCollection newFromXMLCollection: self nextReader entrezSearchResults) parseDocuments.