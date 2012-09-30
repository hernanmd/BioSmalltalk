accessing
atAccession: accessionString
	" Answer a <BioSequence> identified by accessionString "
	
	^ set 
		detect: [: sequence | sequence name = accessionString ]
		ifNone: [ self signalAlignmentNotFound: accessionString ]