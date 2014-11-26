initialize
initialize
	" Private - See superimplementor's comment "

	super initialize.
	self initializeResults.
	self parserLimits 
		documentReadLimit: 100000000; " 100 Mbytes"
		externalSubsetReadLimit: 100000000.
	self catchOff.	