*BioTools
asAminoacidName
	" Answer the complete name of the receiver's aminoacid letter. "
	
	^ BioIUPACAlphabet oneLetterAminoacidNames 
			at: self asUppercase
			ifAbsent: [ self signalNotFound: 'Letter code not recognized as aminoacid' ]