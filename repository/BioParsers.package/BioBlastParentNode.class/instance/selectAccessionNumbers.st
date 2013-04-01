hsps accessing
selectAccessionNumbers
	" Answer a <Collection> of accession numbers "
	
	^ (self hitIdentifiers collect: #blastValue) collect: [: defString | BioParser parseAccession: defString ]