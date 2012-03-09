filtering-blast-alignments
alignsWithMinLength: minAlignLength
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to minAlignLength "

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign >= minAlignLength ].
	^ self addFilteredResultsFrom: collection