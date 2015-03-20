accessing-entrez
genBankDownloader

	^ genBankDownloader
		ifNil: [ genBankDownloader := BioNCBIGenBankDownloader newFromReader: self ]
