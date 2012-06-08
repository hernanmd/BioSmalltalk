hsps accessing
selectGeneIdentifiers
	" Answer a <Collection> of gene identifiers "
	
	^ (self hitIdentifiers collect: #blastValue) collect: [: defString | BioParser tokenizeGi: defString ]