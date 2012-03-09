filtering-blast-alignments
alignsPositivesWithThresholdDiff: aNumber
	" Answer a filter with the receiver's hit nodes which were identities are aligned at least up to aNumber "

	| collection |
	
	collection := self hits select: [: node | node selectHspAlign - node selectHspPositive <= aNumber ].
	^ self addFilteredResultsFrom: collection
