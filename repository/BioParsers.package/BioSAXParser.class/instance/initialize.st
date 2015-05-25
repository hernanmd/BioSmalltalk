initialize
initialize
	" Private - See superimplementor's comment "

	super initialize.
	self initializeResults.
	self configuration parserLimits documentReadLimit: 100000000. " 100 Mbytes"
	self externalEntityResolver externalSubsetReadLimit: 100000000.
	self catchOff.	