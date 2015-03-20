as yet unclassified
percentageOverAlignment

	^ self nodes collect: [: node | 
		| ident align |
		ident := self selectIdentity asFloat.
		align := self selectHspAlign asFloat.
		(ident / align * 100.0 roundTo: 0.1) ]
