hsps accessing
selectAccessionNumbers
	" Answer a <Collection> of gene identifiers "
	
	^ (self hitIdentifiers collect: #blastValue) collect: [: defString | BioParser tokenizeAccession: defString ]