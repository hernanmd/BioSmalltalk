filtering-blast-alignments
percentMinIdentityOverAlignment: aPercentageFloat
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to aPercentageFloat. "

	| collection minPct |
	
	minPct := aPercentageFloat roundTo: 0.1.	
	collection := self hits select: [: node | 
						| ident align |
						ident := node selectIdentity asFloat.
						align := node selectHspAlign asFloat.
						( ident / align * 100.0 roundTo: 0.1 ) > minPct ] .
	^ self addFilteredResultsFrom: collection
