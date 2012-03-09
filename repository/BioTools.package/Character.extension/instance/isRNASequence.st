*BioTools
isRNASequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ ( BioIUPACUnambiguousRNA codes includes: self asUppercase ) or: [
		BioIUPACUnambiguousRNA ambiguityCodes includes: self ]