filtering-blast-alignments
percentMinPositiveOverAlignment: aPercentageFloat
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to aPercentageFloat "

	| collection |
	collection := self hits select: [: node | 
						( aPercentageFloat roundTo: 0.1 ) >= 
							( node hspPositive asFloat / node alignLength asFloat * 100.0 roundTo: 0.1 ) ].
	^ self addFilteredResultsFrom: collection