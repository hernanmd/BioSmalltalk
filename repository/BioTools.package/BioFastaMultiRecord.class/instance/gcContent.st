accessing
gcContent
	" Answer a <Dictionary> with the FASTA identifier as key and the resulting GC content as value "
	
	^ (self collect: [ : fr | fr sequenceName ->  fr gcContent ]) asDictionary