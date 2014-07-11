accessing-entrez
genBankDownloader

	^ genBankDownloader
		ifNil: [ genBankDownloader := BioNCBIGenBankDownloader new ]
