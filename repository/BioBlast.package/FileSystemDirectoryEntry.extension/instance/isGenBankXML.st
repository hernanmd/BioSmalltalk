*BioBlast
isGenBankXML
	" Answer <true> if the receiver represents a GenBank XML file "

	^ self  isXML and: [ self asFileReference includesDtd: 'http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd' ]