Parser for mining sequence published data in journal references. See superclass comment for details.

| fileRef |
fileRef := BioObject testFilesFullDirectoryName / 'GenBankTestFiles' / 'TestGBSeq02.xml'.
(BioEntrezXMLGBSeqJournalParser on: fileRef readStream) collectGBSet