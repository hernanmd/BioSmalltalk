accessing
at: aCodonString
	" Answer the amino acid associated with aCodonString or, if isn't found,
	answer the result of evaluating aBlock. "

	^ self table 
			at: aCodonString 
			ifAbsent: [ self signalNotFound: 'Amino acid not found for ' , aCodonString asString ]