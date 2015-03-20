accessing
at: aCodonString ifAbsent: aBlock
	" Answer the amino acid associated with aCodonString or, if isn't found,
	answer the result of evaluating aBlock. "

	^ self table at: aCodonString ifAbsent: aBlock