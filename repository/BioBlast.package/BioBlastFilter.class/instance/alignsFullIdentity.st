filtering-blast-alignments
alignsFullIdentity
	" Answer a filter with the receiver's nodes which were fully aligned (i.e. Identities is 100%)
	i.e. if Hsp_positive = 326 and Hsp_align-len = 327 identity is 99%"

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign = node hspPositive ].
	^ self addFilteredResultsFrom: collection

