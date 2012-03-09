accessing
atAccession: accessionString

	^ set 
		detect: [: sequence | sequence name = accessionString ]
		ifNone: [ self signalNotFound: 'Alignment not found ' translated , accessionString ]