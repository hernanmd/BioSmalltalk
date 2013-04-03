accessing
atAccession: accessionString
	" Answer a <BioSequence> identified by accessionString "
	
	^ set 
		detect: [ : sequence | sequence name asLowercase = accessionString asLowercase ]
		ifNone: [ self signalAlignmentNotFound: accessionString ]