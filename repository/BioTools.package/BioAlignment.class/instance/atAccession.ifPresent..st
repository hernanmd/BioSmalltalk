accessing
atAccession: accessionString ifPresent: aBlock

	| found |
	
	found := self sequences
		detect: [: sequence | sequence name asLowercase = accessionString asLowercase ]
		ifNone: [ nil ].
	^ found
		ifNotNil: aBlock
		ifNil: [ self signalAlignmentNotFound: accessionString ] 