*BioTools
isProteinSequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ ( BioIUPACProtein codes includes: self asUppercase ) or: [
		BioIUPACProtein ambiguityCodes includes: self ]