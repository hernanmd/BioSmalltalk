filtering-blast-alignments
alignsWithMaxLength: maxAlignLength
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to maxAlignLength "

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign <= maxAlignLength ].
	^ self addFilteredResultsFrom: collection