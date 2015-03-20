parse-ncbi-genbank
parseFlatGenBank: aGenBankString
	" Parse aGenBankString and answer a single fasta instance "
	
	^ (BioFlatGenBankParser on: aGenBankString) parse