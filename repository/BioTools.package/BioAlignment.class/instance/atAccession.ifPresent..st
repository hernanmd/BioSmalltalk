accessing
atAccession: accessionString ifPresent: aBlock

	| found |
	
	found := self sequences
		detect: [: sequence | sequence name = accessionString ]
		ifNone: [ nil ].
	^ found
		ifNotNil: aBlock
		ifNil: [ self signalNotFound: 'Alignment not found ' translated , accessionString ] 