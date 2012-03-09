*BioTools
isDNASequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ ( BioIUPACUnambiguousDNA codes includes: self asUppercase ) or: [
		BioIUPACUnambiguousDNA ambiguityCodes includes: self ]