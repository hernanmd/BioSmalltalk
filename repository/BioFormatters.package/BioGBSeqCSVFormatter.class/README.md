BioGBSeqCSVFormatter read results from Entrez GBSeq and write a CSV. This class needs work.

| readers formatter |
readers := BioGBSeqCollection filesFromXMLDirectory: BioNCBIGenBankReaderTest testFilesDirectoryName.
readers parseDocuments.
formatter := BioFileFormatter formatterFor: 'GBSeqReport'.
formatter 
	exportFrom: readers 
	interval: (16023 to: 16262).