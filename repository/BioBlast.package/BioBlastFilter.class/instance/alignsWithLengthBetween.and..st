filtering-blast-alignments
alignsWithLengthBetween: minAlignLength and: maxAlignLength
	" Answer a filter with the receiver's hit nodes which were identities are aligned between maxAlignLength and minAlignLength "

	| collection |
	collection := self hits
		select: [ :node | 
			| alignSize |
			alignSize := node selectHspAlign.
			alignSize >= minAlignLength and: [ alignSize <= maxAlignLength ] ].
	^ self addFilteredResultsFrom: collection