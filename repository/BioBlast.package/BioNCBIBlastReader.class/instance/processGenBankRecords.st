accessing-entrez
processGenBankRecords

	^ ( BioGBSeqCollection 
			newFromXMLCollection: self nextReader entrezSearchResults ) 
				parseDocuments.