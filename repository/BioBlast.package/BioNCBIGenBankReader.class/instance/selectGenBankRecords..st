accessing-entrez
selectGenBankRecords: aBlock
	" Select GenBank records from XML contents retrieved on-line and answer a <Collection> "
	
	contents := self genBankRecordsAsXML parseDocuments.
	^ (contents select: aBlock) asBio: self nodesCollectionClass