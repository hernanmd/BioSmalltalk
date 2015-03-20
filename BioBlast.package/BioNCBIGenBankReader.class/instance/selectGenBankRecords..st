accessing-entrez
selectGenBankRecords: aBlock
	" On-Line version "
	
	contents := self genBankRecordsAsXML parseDocuments.
	^ ( contents select: aBlock ) asBio: self nodesCollectionClass