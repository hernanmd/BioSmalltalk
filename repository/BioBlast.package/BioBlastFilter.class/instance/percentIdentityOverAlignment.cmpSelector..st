filtering-blast-alignments
percentIdentityOverAlignment: aPercentageFloat cmpSelector: cmpSymbol
	" Answer a filter with the receiver's hit nodes which were identities are aligned up to aPercentageFloat. "

	| nodes pct |
	
	pct := aPercentageFloat asNumber roundTo: 0.1.	
	nodes := self hits select: [: node | 
						| ident align |
						ident := node selectIdentity asFloat.
						align := node selectHspAlign asFloat.
						(ident / align * 100.0 roundTo: 0.1) perform: cmpSymbol with: pct  ] .
	^ self addFilteredResultsFrom: nodes

