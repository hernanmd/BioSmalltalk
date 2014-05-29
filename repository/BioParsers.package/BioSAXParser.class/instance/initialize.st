initialize
initialize
	" Private - See superimplementor's comment "

	super initialize.
	self initializeResults.
	self configuration parserLimits documentReadLimit: 10000000.
	self catchOff.	